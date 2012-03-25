
extern "C" {

#include <scicos/scicos_block4.h>


    void sci_pidDLP(scicos_block *block,int flag)
    {
        /* init */
        if (flag == 4) {
            double * x = (double*)GetDstate(block);
            x[0] = get_scicos_time(); // set initial time;
            /* output computation */                            
        } else if(flag == 1) {
            
            // real parameters
            double kP = block->rpar[0];
            double kI = block->rpar[1];
            double kD = block->rpar[2];
            double i_min = block->rpar[3];
            double i_max = block->rpar[4];
            double y_min = block->rpar[5];
            double y_max = block->rpar[6];
            double w_cut = block->rpar[7];
            
            // inputs;
            double * u1 = (double*)GetInPortPtrs(block,1); 
            double * u2 = (double*)GetInPortPtrs(block,2); 
            double r = u1[0];
            double v = u2[0];
            
            // outputs
            double * y1 = (double*)GetOutPortPtrs(block,1); ;
            double * y2 = (double*)GetOutPortPtrs(block,2); ;
            
            // states
            double * x = (double*)GetDstate(block);
            double t0 = x[0];
            double i0 = x[1];
            double e0 = x[2];
            double d0 = x[3];
            
            double t = get_scicos_time();
            double dt = t-t0;
            
            double e = r-v;
            double i = i0 + e*dt;
            double d = 0;
            if (dt > 1e-6) d = (e - e0)/dt;
            
            // low pass filter;
            double alpha = w_cut*dt/(1+w_cut*dt);
            
            // saturate i;
            if (i > i_max) i = i_max;
            if (i< i_min) i = i_min;
            
            // low pass;
            d = alpha*d + (1-alpha)*d0;
            
            // compute error;
            double y = kP*e + kI*i + kD*d;
            
            // saturate y;
            if (y > y_max) y = y_max;
            if (y< y_min) y = y_min;
            
            // save state;
            x[0] = t;
            x[1] = i;
            x[2] = e;
            x[3] = d;
            
            // save output;
            y1[0] = y;
            y2[0] = e;

            /* ending */
        } else  if (flag == 5) {

        }
    }
}
// vim:ts=4:sw=4:expandtab
