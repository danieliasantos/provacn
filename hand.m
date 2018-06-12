% http://www.dms.uaf.edu/~bueler/M310F10_A7S.pdf
% HAND  Use natural cubic splines to plot a smooth version of my hand.

% these 39 points were entered with these commands, followed by 39 mouse clicks,
% followed by hitting enter:

%figure('position',get(0,'screensize'))   % figure fills whole screen
%axes('position',[0 0 1 1])               % treat axes as  0<x<1,  0<y<1
%[x,y]=ginput;                            % record mouse click location until
                                          %   enter is pressed

xy = [...
   0.203613   0.171917;
   0.365234   0.094505;
   0.555176   0.080586;
   0.584961   0.156777;
   0.437500   0.243712;
   0.415527   0.260317;
   0.502686   0.300611;
   0.672852   0.305983;
   0.796875   0.350427;
   0.790771   0.440293;
   0.667480   0.440293;
   0.581055   0.447131;
   0.521484   0.458364;
   0.588867   0.485958;
   0.665771   0.509402;
   0.747559   0.534310;
   0.818848   0.584127;
   0.803955   0.685226;
   0.727783   0.664469;
   0.635254   0.643712;
   0.539551   0.613187;
   0.494873   0.610501;
   0.526123   0.625641;
   0.603027   0.653236;
   0.694092   0.685226;
   0.757812   0.715507;
   0.760010   0.802686;
   0.628906   0.781929;
   0.522949   0.751648;
   0.447754   0.726740;
   0.435059   0.752869;
   0.497803   0.801465;
   0.557617   0.842735;
   0.625977   0.888400;
   0.633789   0.963126;
   0.566162   0.971429;
   0.462646   0.910623;
   0.291504   0.822222;
   0.163574   0.746032];

set(0,'defaultlinelinewidth',2.5,'defaultlinemarkersize',6)
t = 1:39;       % "fake" t-axis for parameterized curve is just the point index
tt = 1:.01:39;  % fill-in for smooth plot
x = xy(:,1)';
y = xy(:,2)';
xx = ncspline(t,x,tt);
yy = ncspline(t,y,tt);
plot(x,y,'bo')