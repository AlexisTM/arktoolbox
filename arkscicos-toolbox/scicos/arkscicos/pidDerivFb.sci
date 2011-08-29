function [x,y,typ]=pidDerivFb(job,arg1,arg2)
//Generated from SuperBlock on 13-Mar-2011
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
  y=needcompile
  typ=list()
  graphics=arg1.graphics;
  exprs=graphics.exprs
  Btitre=..
    "Set PID w/ d/dt feedback Parameters"
  Exprs0=..
    ["y_min";"y_max";"kP";"kI";"kD";"i_min";"i_max"]
  Bitems=..
    ["min output";"max output";"kP";"kI";"kD";"min integral windup";"max integral windup"]
  Ss=..
    list("pol",-1,"pol",-1,"pol",-1,"pol",-1,"pol",-1,"pol",-1,"pol",-1)
  scicos_context=struct()
     x=arg1
  ok=%f
  while ~ok do
    [ok,scicos_context.y_min,scicos_context.y_max,scicos_context.kP,scicos_context.kI,scicos_context.kD,scicos_context.i_min,scicos_context.i_max,exprs]=getvalue(Btitre,Bitems,Ss,exprs)
    if ~ok then return;end
     %scicos_context=scicos_context
     sblock=x.model.rpar
     [%scicos_context,ierr]=script2var(sblock.props.context,%scicos_context)
     if ierr==0 then
       [sblock,%w,needcompile2,ok]=do_eval(sblock,list(),%scicos_context)
   if ok then
          y=max(2,needcompile,needcompile2)
          x.graphics.exprs=exprs
          x.model.rpar=sblock
          break
   end
     else
       err=lasterror();
       if err<>[] then message(err);end
   ok=%f
     end
  end
case 'define' then
scs_m_1=scicos_diagram(..
        version="scicos4.4",..
        props=scicos_params(..
              wpar=[-279.26582,582.85282,950.44693,1462.6028,1177,708,0,30,1177,708,229,89,1.4],..
              Title=["SuperBlock","demos/"],..
              tol=[1;1;0.0083333;0.0083333;1;0;0.0083333],..
              tf=30,..
              context=["";""],..
              void1=[],..
              options=tlist(["scsopt","3D","Background","Link","ID","Cmap"],list(%t,33),[8,1],[1,5,2],..
              list([4,1,10,1],[4,1,2,1]),[0.8,0.8,0.8]),..
              void2=[],..
              void3=[],..
              doc=list()))
scs_m_1.objs(1)=scicos_block(..
                gui="GAINBLK",..
                graphics=scicos_graphics(..
                         orig=[42.771195,1227.8276],..
                         sz=[40,40],..
                         flip=%t,..
                         theta=0,..
                         exprs=["kP";"0"],..
                         pin=28,..
                         pout=26,..
                         pein=[],..
                         peout=[],..
                         gr_i=list("",8),..
                         id="",..
                         in_implicit="E",..
                         out_implicit="E"),..
                model=scicos_model(..
                         sim=list("gainblk",4),..
                         in=-1,..
                         in2=-2,..
                         intyp=-1,..
                         out=-1,..
                         out2=-2,..
                         outtyp=-1,..
                         evtin=[],..
                         evtout=[],..
                         state=[],..
                         dstate=[],..
                         odstate=list(),..
                         rpar=1,..
                         ipar=0,..
                         opar=list(1),..
                         blocktype="c",..
                         firing=[],..
                         dep_ut=[%t,%f],..
                         label="",..
                         nzcross=0,..
                         nmode=0,..
                         equations=list()),..
                doc=list())
scs_m_1.objs(2)=mlist("Deleted")
scs_m_1.objs(3)=scicos_block(..
                gui="INTEGRAL_m",..
                graphics=scicos_graphics(..
                         orig=[112.5339,1177.9295],..
                         sz=[40,40],..
                         flip=%t,..
                         theta=0,..
                         exprs=["0";"0";"0";"i_max";"i_min"],..
                         pin=30,..
                         pout=31,..
                         pein=[],..
                         peout=[],..
                         gr_i=list(..
                         ["thick=xget(''thickness'')";
                         "pat=xget(''pattern'')";
                         "fnt=xget(''font'')";
                         "xpoly(orig(1)+[0.7;0.62;0.549;0.44;0.364;0.291]*sz(1),orig(2)+[0.947;0.947;0.884;0.321;0.255;0.255]*sz(2),''lines'')";
                         "txt=''1/s'';";
                         "style=5;";
                         "rectstr=stringbox(txt,orig(1),orig(2),0,style,1);";
                         "if ~exists(''%zoom'') then %zoom=1, end;";
                         "w=(rectstr(1,3)-rectstr(1,2))*%zoom;";
                         "h=(rectstr(2,2)-rectstr(2,4))*%zoom;";
                         "xstringb(orig(1)+sz(1)/2-w/2,orig(2)-h-4,txt,w,h,''fill'');";
                         "e=gce();";
                         "e.font_style=style;";
                         "xset(''thickness'',thick)";
                         "xset(''pattern'',pat)";
                         "xset(''font'',fnt(1),fnt(2))"],8),..
                         id="",..
                         in_implicit="E",..
                         out_implicit="E"),..
                model=scicos_model(..
                         sim=list("integral_func",4),..
                         in=-1,..
                         in2=-2,..
                         intyp=1,..
                         out=-1,..
                         out2=-2,..
                         outtyp=1,..
                         evtin=[],..
                         evtout=[],..
                         state=0,..
                         dstate=[],..
                         odstate=list(),..
                         rpar=[],..
                         ipar=[],..
                         opar=list(),..
                         blocktype="c",..
                         firing=[],..
                         dep_ut=[%f,%t],..
                         label="",..
                         nzcross=0,..
                         nmode=0,..
                         equations=list()),..
                doc=list())
scs_m_1.objs(4)=mlist("Deleted")
scs_m_1.objs(5)=scicos_block(..
                gui="SUMMATION",..
                graphics=scicos_graphics(..
                         orig=[234.69001,1202.8276],..
                         sz=[40,60],..
                         flip=%t,..
                         theta=0,..
                         exprs=["1";"[1;1;-1]";"0"],..
                         pin=[26;31;34],..
                         pout=35,..
                         pein=[],..
                         peout=[],..
                         gr_i=list(..
                         ["[x,y,typ]=standard_inputs(o) ";
                         "dd=sz(1)/8,de=0,";
                         "if ~arg1.graphics.flip then dd=6*sz(1)/8,de=-sz(1)/8,end";
                         "for k=1:size(x,''*'')";
                         "if size(sgn,1)>1 then";
                         "  if sgn(k)>0 then";
                         "    xstring(orig(1)+dd,y(k)-4,''+'')";
                         "  else";
                         "    xstring(orig(1)+dd,y(k)-4,''-'')";
                         "  end";
                         "end";
                         "end";
                         "xx=sz(1)*[.8 .4 0.75 .4 .8]+orig(1)+de";
                         "yy=sz(2)*[.8 .8 .5 .2 .2]+orig(2)";
                         "xpoly(xx,yy,''lines'')"],8),..
                         id="",..
                         in_implicit=["E";"E";"E"],..
                         out_implicit="E"),..
                model=scicos_model(..
                         sim=list("summation",4),..
                         in=[-1;-1;-1],..
                         in2=[-2;-2;-2],..
                         intyp=[1;1;1],..
                         out=-1,..
                         out2=-2,..
                         outtyp=1,..
                         evtin=[],..
                         evtout=[],..
                         state=[],..
                         dstate=[],..
                         odstate=list(),..
                         rpar=0,..
                         ipar=[1;1;-1],..
                         opar=list(),..
                         blocktype="c",..
                         firing=[],..
                         dep_ut=[%t,%f],..
                         label="",..
                         nzcross=0,..
                         nmode=0,..
                         equations=list()),..
                doc=list())
scs_m_1.objs(6)=mlist("Deleted")
scs_m_1.objs(7)=scicos_block(..
                gui="IN_f",..
                graphics=scicos_graphics(..
                         orig=[-113.9592,1247.8276],..
                         sz=[20,20],..
                         flip=%t,..
                         theta=0,..
                         exprs=["1";"-1";"-1"],..
                         pin=[],..
                         pout=13,..
                         pein=[],..
                         peout=[],..
                         gr_i=list(" ",8),..
                         id="sp",..
                         in_implicit=[],..
                         out_implicit="E"),..
                model=scicos_model(..
                         sim="input",..
                         in=[],..
                         in2=[],..
                         intyp=1,..
                         out=-1,..
                         out2=-2,..
                         outtyp=-1,..
                         evtin=[],..
                         evtout=[],..
                         state=[],..
                         dstate=[],..
                         odstate=list(),..
                         rpar=[],..
                         ipar=1,..
                         opar=list(),..
                         blocktype="c",..
                         firing=[],..
                         dep_ut=[%f,%f],..
                         label="",..
                         nzcross=0,..
                         nmode=0,..
                         equations=list()),..
                doc=list())
scs_m_1.objs(8)=mlist("Deleted")
scs_m_1.objs(9)=scicos_block(..
                gui="OUT_f",..
                graphics=scicos_graphics(..
                         orig=[388.91753,1222.701],..
                         sz=[20,20],..
                         flip=%t,..
                         theta=0,..
                         exprs="1",..
                         pin=22,..
                         pout=[],..
                         pein=[],..
                         peout=[],..
                         gr_i=list(" ",8),..
                         id="",..
                         in_implicit="E",..
                         out_implicit=[]),..
                model=scicos_model(..
                         sim="output",..
                         in=-1,..
                         in2=-2,..
                         intyp=-1,..
                         out=[],..
                         out2=[],..
                         outtyp=1,..
                         evtin=[],..
                         evtout=[],..
                         state=[],..
                         dstate=[],..
                         odstate=list(),..
                         rpar=[],..
                         ipar=1,..
                         opar=list(),..
                         blocktype="c",..
                         firing=[],..
                         dep_ut=[%f,%f],..
                         label="",..
                         nzcross=0,..
                         nmode=0,..
                         equations=list()),..
                doc=list())
scs_m_1.objs(10)=mlist("Deleted")
scs_m_1.objs(11)=scicos_block(..
                 gui="SUMMATION",..
                 graphics=scicos_graphics(..
                          orig=[-28.19516,1217.8276],..
                          sz=[40,60],..
                          flip=%t,..
                          theta=0,..
                          exprs=["1";"[1;-1]";"0"],..
                          pin=[13;15],..
                          pout=25,..
                          pein=[],..
                          peout=[],..
                          gr_i=list(..
                          ["[x,y,typ]=standard_inputs(o) ";
                          "dd=sz(1)/8,de=0,";
                          "if ~arg1.graphics.flip then dd=6*sz(1)/8,de=-sz(1)/8,end";
                          "for k=1:size(x,''*'')";
                          "if size(sgn,1)>1 then";
                          "  if sgn(k)>0 then";
                          "    xstring(orig(1)+dd,y(k)-4,''+'')";
                          "  else";
                          "    xstring(orig(1)+dd,y(k)-4,''-'')";
                          "  end";
                          "end";
                          "end";
                          "xx=sz(1)*[.8 .4 0.75 .4 .8]+orig(1)+de";
                          "yy=sz(2)*[.8 .8 .5 .2 .2]+orig(2)";
                          "xpoly(xx,yy,''lines'')"],8),..
                          id="",..
                          in_implicit=["E";"E"],..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim=list("summation",4),..
                          in=[-1;-1],..
                          in2=[-2;-2],..
                          intyp=[1;1],..
                          out=-1,..
                          out2=-2,..
                          outtyp=1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=0,..
                          ipar=[1;-1],..
                          opar=list(),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%t,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(12)=mlist("Deleted")
scs_m_1.objs(13)=scicos_link(..
                   xx=[-93.959204;-36.766588],..
                   yy=[1257.8276;1257.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[7,1,0],..
                   to=[11,1,1])
scs_m_1.objs(14)=scicos_block(..
                 gui="IN_f",..
                 graphics=scicos_graphics(..
                          orig=[-126.19154,1200.2593],..
                          sz=[20,20],..
                          flip=%t,..
                          theta=0,..
                          exprs=["2";"-1";"-1"],..
                          pin=[],..
                          pout=15,..
                          pein=[],..
                          peout=[],..
                          gr_i=list(" ",8),..
                          id="y",..
                          in_implicit=[],..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim="input",..
                          in=[],..
                          in2=[],..
                          intyp=1,..
                          out=-1,..
                          out2=-2,..
                          outtyp=-1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=[],..
                          ipar=2,..
                          opar=list(),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%f,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(15)=scicos_link(..
                   xx=[-106.19154;-80.459897;-80.459897;-36.766588],..
                   yy=[1210.2593;1210.2593;1237.8276;1237.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[14,1,0],..
                   to=[11,2,1])
scs_m_1.objs(16)=scicos_block(..
                 gui="IN_f",..
                 graphics=scicos_graphics(..
                          orig=[87.9487,1126.7872],..
                          sz=[20,20],..
                          flip=%t,..
                          theta=0,..
                          exprs=["3";"-1";"-1"],..
                          pin=[],..
                          pout=33,..
                          pein=[],..
                          peout=[],..
                          gr_i=list(" ",8),..
                          id="dy",..
                          in_implicit=[],..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim="input",..
                          in=[],..
                          in2=[],..
                          intyp=1,..
                          out=-1,..
                          out2=-2,..
                          outtyp=-1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=[],..
                          ipar=3,..
                          opar=list(),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%f,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(17)=mlist("Deleted")
scs_m_1.objs(18)=mlist("Deleted")
scs_m_1.objs(19)=mlist("Deleted")
scs_m_1.objs(20)=scicos_block(..
                 gui="SATURATION",..
                 graphics=scicos_graphics(..
                          orig=[311.52563,1212.701],..
                          sz=[40,40],..
                          flip=%t,..
                          theta=0,..
                          exprs=["y_max";"y_min";"1"],..
                          pin=35,..
                          pout=22,..
                          pein=[],..
                          peout=[],..
                          gr_i=list(..
                          ["thick=xget(''thickness'');xset(''thickness'',2);";
                          "xx=orig(1)+[4/5;1/2+1/5;1/2-1/5;1/5]*sz(1);";
                          "yy=orig(2)+[1-1/5;1-1/5;1/5;1/5]*sz(2);";
                          "xpoly(xx,yy,''lines'');";
                          "xset(''thickness'',thick)"],8),..
                          id="",..
                          in_implicit="E",..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim=list("satur",4),..
                          in=1,..
                          in2=[],..
                          intyp=1,..
                          out=1,..
                          out2=[],..
                          outtyp=1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=[1;-1],..
                          ipar=[],..
                          opar=list(),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%t,%f],..
                          label="",..
                          nzcross=2,..
                          nmode=1,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(21)=mlist("Deleted")
scs_m_1.objs(22)=scicos_link(..
                   xx=[360.09706;388.91753],..
                   yy=[1232.701;1232.701],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[20,1,0],..
                   to=[9,1,1])
scs_m_1.objs(23)=scicos_block(..
                 gui="GAINBLK",..
                 graphics=scicos_graphics(..
                          orig=[44.394753,1177.9295],..
                          sz=[40,40],..
                          flip=%t,..
                          theta=0,..
                          exprs=["kI";"0"],..
                          pin=29,..
                          pout=30,..
                          pein=[],..
                          peout=[],..
                          gr_i=list("",8),..
                          id="",..
                          in_implicit="E",..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim=list("gainblk",4),..
                          in=-1,..
                          in2=-2,..
                          intyp=-1,..
                          out=-1,..
                          out2=-2,..
                          outtyp=-1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=1,..
                          ipar=0,..
                          opar=list(1),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%t,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(24)=mlist("Deleted")
scs_m_1.objs(25)=scicos_link(..
                   xx=[20.376269;25.521376],..
                   yy=[1247.8276;1247.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[11,1,0],..
                   to=[27,1,1])
scs_m_1.objs(26)=scicos_link(..
                   xx=[91.342623;226.11858],..
                   yy=[1247.8276;1247.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[1,1,0],..
                   to=[5,1,1])
scs_m_1.objs(27)=scicos_block(..
                 gui="SPLIT_f",..
                 graphics=scicos_graphics(..
                          orig=[25.521376;1247.8276],..
                          sz=[0.3333333,0.3333333],..
                          flip=%t,..
                          theta=0,..
                          exprs=[],..
                          pin=25,..
                          pout=[28;29],..
                          pein=[],..
                          peout=[],..
                          gr_i=list([],8),..
                          id="",..
                          in_implicit="E",..
                          out_implicit=["E";"E";"E"]),..
                 model=scicos_model(..
                          sim="lsplit",..
                          in=-1,..
                          in2=[],..
                          intyp=1,..
                          out=[-1;-1;-1],..
                          out2=[],..
                          outtyp=1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=[],..
                          ipar=[],..
                          opar=list(),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%t,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(28)=scicos_link(..
                   xx=[25.521376;34.199766],..
                   yy=[1247.8276;1247.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[27,1,0],..
                   to=[1,1,1])
scs_m_1.objs(29)=scicos_link(..
                   xx=[25.521376;25.521376;35.823324],..
                   yy=[1247.8276;1197.9295;1197.9295],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[27,2,0],..
                   to=[23,1,1])
scs_m_1.objs(30)=scicos_link(..
                   xx=[92.966181;103.96247],..
                   yy=[1197.9295;1197.9295],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[23,1,0],..
                   to=[3,1,1])
scs_m_1.objs(31)=scicos_link(..
                   xx=[161.10533;178.68609;178.68609;226.11858],..
                   yy=[1197.9295;1197.9295;1232.8276;1232.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[3,1,0],..
                   to=[5,2,1])
scs_m_1.objs(32)=scicos_block(..
                 gui="GAINBLK",..
                 graphics=scicos_graphics(..
                          orig=[138.76164,1116.7872],..
                          sz=[40,40],..
                          flip=%t,..
                          theta=0,..
                          exprs=["kD";"0"],..
                          pin=33,..
                          pout=34,..
                          pein=[],..
                          peout=[],..
                          gr_i=list("",8),..
                          id="",..
                          in_implicit="E",..
                          out_implicit="E"),..
                 model=scicos_model(..
                          sim=list("gainblk",4),..
                          in=-1,..
                          in2=-2,..
                          intyp=-1,..
                          out=-1,..
                          out2=-2,..
                          outtyp=-1,..
                          evtin=[],..
                          evtout=[],..
                          state=[],..
                          dstate=[],..
                          odstate=list(),..
                          rpar=1,..
                          ipar=0,..
                          opar=list(1),..
                          blocktype="c",..
                          firing=[],..
                          dep_ut=[%t,%f],..
                          label="",..
                          nzcross=0,..
                          nmode=0,..
                          equations=list()),..
                 doc=list())
scs_m_1.objs(33)=scicos_link(..
                   xx=[107.9487;130.19021],..
                   yy=[1136.7872;1136.7872],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[16,1,0],..
                   to=[32,1,1])
scs_m_1.objs(34)=scicos_link(..
                   xx=[187.33307;205.54436;205.54436;226.11858],..
                   yy=[1136.7872;1136.7872;1217.8276;1217.8276],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[32,1,0],..
                   to=[5,3,1])
scs_m_1.objs(35)=scicos_link(..
                   xx=[283.26143;302.9542],..
                   yy=[1232.8276;1232.701],..
                   id="",..
                   thick=[0,0],..
                   ct=[1,1],..
                   from=[5,1,0],..
                   to=[20,1,1])
  model=scicos_model()
  model.sim="csuper"
  model.in=[-1;-1;-1]
  model.in2=[-2;-2;-2]
  model.intyp=[-1;-1;-1]
  model.out=-1
  model.out2=-2
  model.outtyp=-1
  model.evtin=[]
  model.evtout=[]
  model.state=[]
  model.dstate=[]
  model.odstate=list()
  model.rpar=scs_m_1
  model.ipar=1
  model.opar=list()
  model.blocktype="h"
  model.firing=[]
  model.dep_ut=[%f,%f]
  model.label=""
  model.nzcross=0
  model.nmode=0
  model.equations=list()
  y_min=-1
  y_max=1
  kP=1
  kI=1
  kD=1
  i_min=-1
  i_max=1
  exprs=[sci2exp(y_min,0);sci2exp(y_max,0);sci2exp(kP,0);sci2exp(kI,0);sci2exp(kD,0);sci2exp(i_min,0);sci2exp(i_max,0);]
  gr_i=list(..
       ["xstring(orig(1)+sz(1)*0.37,orig(2)+sz(2)*0.76,[""PID""]);";
       "xstring(orig(1)+sz(1)*0.37,orig(2)+sz(2)*0.62,[""w/ d/dt""]);";
       "xstring(orig(1)+sz(1)*0.38,orig(2)+sz(2)*0.48,[""feedback""]);";
       "xstring(orig(1)+sz(1)*0.06,orig(2)+sz(2)*0.76,[""r""]);";
       "xstring(orig(1)+sz(1)*0.07,orig(2)+sz(2)*0.49,[""y""]);";
       "xstring(orig(1)+sz(1)*0.07,orig(2)+sz(2)*0.21,[""dy""]);"],8)
  x=standard_define([4,4],model,exprs,gr_i)
end
endfunction