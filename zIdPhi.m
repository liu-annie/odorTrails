function [dphi,dphi1,minMSE,nSelect] = zIdPhi(dx,dy,dT,window,postSmoothing)

% sd = zIdPhi(sd, varargin)
%
% Calculates zIdPhi
% 2012-04-16 AndyP added arbitrary (tstart, tend) times
% 2012-06-21 AndyP fixed x,y assignment error line 17
% 2012-06-21 AndyP added VT1 or VT2 option
%
% 2012-07-25 ADR tend defined as ExitingCPTime
% 2013-01-21 AndyP added checks for sorted timestamps, dxdt returns error if timestamps are out of order  
% VT = 1;
% dxdtWindow = 0.5;
% dxdtSmoothing = 0.1;
% tstart = sd.EnteringCPTime;
% tend = sd.ExitingCPTime;
% nL = 100;
% 
% process_varargin(varargin);
% %%%%%%%%%%%%%%%%%%%%
% if VT==1
% 	x = sd.x;
% 	y = sd.y;
% elseif VT==2
% 	x = sd.x2;
% 	y = sd.y2;
% else
% 	error('unknown VT');
% end
%%%%%%%%%%%%%%%%%%%%
% assert(length(tstart)==length(tend),'tstart must equal tend');
% if ~issorted(x.range); time=sort(x.range); x=tsd(time,x.data); end % cheetah (ring buffer error?) causes out of order timestamps
% if ~issorted(y.range); time=sort(y.range); y=tsd(time,y.data); end
% [ dx ] = dxdt(x, 'window', dxdtWindow, 'postSmoothing',dxdtSmoothing);
% [ dy ] = dxdt(y, 'window', dxdtWindow, 'postSmoothing',dxdtSmoothing);


phi = atan2(dy, dx);
uphi = unwrap(phi);
[dphi,minMSE,nSelect] = dxdt(phi,dT,window,postSmoothing);

ddy = dxdt(dy,dT,window,postSmoothing);
ddx = dxdt(dx,dT,window,postSmoothing);
dphi1 = (dx.*ddy-dy.*ddx)./(dx.^2+dy.^2);






