function [x,y,typ]=jsbsimComm(job,arg1,arg2)
//
// jsbsimComm.sci
//
// USAGE:
//
// output 1: (state x) 
//  [1]  Vt
//  [2]  Alpha
//  [3]  Theta
//  [4]  Q
//  [5]  Beta
//  [6]  Phi
//  [7]  P
//  [8]  Psi
//  [9] R
//  [10] Latitude,
//  [11] Longitude
//  [12] Alt
//  [13] Rpm(if prop)
//  [14] PropPitch (if prop)
//
// output 2: (output y) 
// 	[1]  Latitude
//  [2]  Longitude 
//  [3]  Altitude
//  [4]  COG (course over ground)
//  [5]  VGround
//  [6]  AccelX
//  [7]  AccelY
//  [8]  AccelZ
//  [9]  P
//  [10] Q
//  [11] R
//  [12] Vn
//  [13] Ve 
//  [14] Vd 
//
// input: (input u)
//  [1] Throttle
//  [2] Aileron
//  [3] Elevator
//  [4] Rudder
//
// Options: 
//
//  enable flightgear comm:
//
//      0: will be turned off
//      1: will broadcast udp messages to the host and port name given 
//
//      If using flightgear, this will required the following command-line options
//      --fdm=external --native-fdm=socket,in,10,,6001,udp
// 
//      Here 6001 is the default udp port used for the jsbsimcomm block, but you may
//      subsitute another port number.
//
// AUTHOR:
//
// Copyright (C) James Goppert 2010 <jgoppert@users.sourceforge.net>
//
// jsbsimComm.sci is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// jsbsimComm.sci is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  If not, see <http://www.gnu.org/licenses/>.
//
mode(-1);
x=[];y=[];typ=[];

select job
	case 'plot' then
	 	standard_draw(arg1)
	case 'getinputs' then
	 	[x,y,typ]=standard_inputs(arg1)
	case 'getoutputs' then
	 	[x,y,typ]=standard_outputs(arg1)
	case 'getorigin' then
	 	[x,y]=standard_origin(arg1)
	case 'set' then
		x=arg1;
		graphics=arg1.graphics;exprs=graphics.exprs
		model=arg1.model;
		while %t do
			labels=[..
				'root path';..
				'aircraft path';..
				'engine path';..
				'systems path';..
				'model name';..
				'x0';..
				'debug level';..
				'enable Flight Gear comm';..
				'Flight Gear host';..
				'Flight Gear port'];
			[ok,Root,AircraftPath,EnginePath,SystemsPath,ModelName,x0,DebugLevel,..
				EnableFlightGearComm,FlightGearHost,FlightGearPort,exprs]=..
				getvalue('Set JSBSim Parameters',labels,..
				list('str',-1,'str',-1,'str',-1,'str',-1,'str',-1,'vec',-1,'vec',1,..
					'vec',1,'str',-1,'vec',1),exprs);
			if ~ok then break,end
			n=size(x0,1)
			model.out=[n;14];
			[model,graphics,ok]=check_io(model,graphics,[4],model.out,[],[])
			if ok then
				model.state=[x0];
				model.ipar=[..
					length(evstr(Root)),ascii(evstr(Root)),0,..
					length(evstr(AircraftPath)),ascii(evstr(AircraftPath)),0,..
					length(evstr(EnginePath)),ascii(evstr(EnginePath)),0,..
					length(evstr(SystemsPath)),ascii(evstr(SystemsPath)),0,..
					length(evstr(ModelName)),ascii(evstr(ModelName)),0,..
					length(evstr(FlightGearHost)),ascii(evstr(FlightGearHost)),0,..
					DebugLevel,EnableFlightGearComm,FlightGearPort];
				graphics.exprs=exprs;
				x.graphics=graphics;
				x.model=model;
				break
			end
		end
	case 'define' then
		// set model properties
		model=scicos_model()
		model.sim=list('sci_jsbsimComm',4)
		model.in=4
		model.out=[14;14]
		model.blocktype='c'
		model.dep_ut=[%f %t]

		// jsbsim parameters
		Root="arkhangarDataPath+""/aircraft/easystar""";
		ModelName="""easystar-datcom""";
		AircraftPath="""""";
		EnginePath="""""";
		SystemsPath="""""";
		DebugLevel=0;
		FlightGearHost="""localhost""";
		FlightGearPort=5500;
		EnableFlightGearComm=0;
		model.ipar=[..
					length(evstr(Root)),ascii(evstr(Root)),0,..
					length(evstr(AircraftPath)),ascii(evstr(AircraftPath)),0,..
					length(evstr(EnginePath)),ascii(evstr(EnginePath)),0,..
					length(evstr(SystemsPath)),ascii(evstr(SystemsPath)),0,..
					length(evstr(ModelName)),ascii(evstr(ModelName)),0,..
					length(evstr(FlightGearHost)),ascii(evstr(FlightGearHost)),0,..
					DebugLevel,EnableFlightGearComm,FlightGearPort];
		
		// intial state
		x0="place x0 here";

		// save state
		model.state=x0;

		// initialize strings for gui
		exprs=[
			strcat(Root),..
			strcat(AircraftPath),strcat(EnginePath),..
			strcat(SystemsPath),strcat(ModelName),..
			strcat(sci2exp(x0)),strcat(sci2exp(DebugLevel)),..
			strcat(sci2exp(EnableFlightGearComm)),strcat(FlightGearHost),..
			strcat(sci2exp(FlightGearPort))];

		// setup icon
	  	gr_i=['xstringb(orig(1),orig(2),''JSBSimComm'',sz(1),sz(2),''fill'');']
	  	x=standard_define([5 2],model,exprs,gr_i)
	end
endfunction

// vim:ts=4:sw=4
