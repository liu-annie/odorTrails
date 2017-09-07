% get AngleRel2Spot

doTest = false;

nM = max(mouse);
nS = max(sess);

nP = length(x);

headang = nan(nP,1);
spotang = nan(nP,1);
for iM=1:nM
    disp(iM);
    for iS=1:nS
        k = mouse==iM & sess==iS;
        kT = mouseT==iM & sessT==iS;
        
        if sum(k)>0
            
            dx = foaw_diff(nx(k),1/50,50,1,0.33);
            dy = foaw_diff(ny(k),1/50,50,1,0.33);
            headang(k) = atan2(dy,dx);
            
            xT2 = nanmedian(xT1(kT));
            yT2 = nanmedian(yT1(kT));
            
            spot = atan2(yT2,xT2);
            
            temp = angdiff(headang(k),repmat(spot,size(headang(k))));
            spotang(k) = temp;
            
            
            if doTest
                figure(1); clf;
                %plot(x(k),y(k),'k.','markersize',5); hold on;
                plot(xT1(kT),yT1(kT),'r.');
                
                vectorLength = sqrt(xT2.^2+yT2.^2);
                
                startPoint = [0,0]';
                endPoint = startPoint + vectorLength*[cos(spot); sin(spot)];
                myLine = [startPoint, endPoint];
                plot(myLine(1,:), myLine(2, :), ':b ', 'linewidth', 2);
                
                scatter(x(k),y(k),5,headang(k),'filled');
                colorbar;
                pause;
                
                
            end
        end
    end
end
