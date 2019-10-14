function [pres,t]=normalize(p)
    si=size(p);
    
    few=p(1:si(1)-1,:);
    fewm= mean(few,2);
    x=fewm(1,1);
    y=fewm(2,1);
    
    for i=1:si(2)
        few(:,i)=few(:,i)-fewm;
    end
    
    scale=sqrt(2)/mean(sqrt(sum(few.^2)));
    
    t=[scale,0,-scale*x;0,scale,-scale*y;0,0,1];
    
    pres=t*p;
end