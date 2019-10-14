function fmat=estimateFundamentalMatrix(p1,p2)
    [p1,t1]=normalize(p1); %from hint 1
    [p2,t2]=normalize(p2);
    si=size(p1);
    k=zeros(si(2),9);
    for i=1:si(2)
        k(i,:)=kron(p2(:,i)',p1(:,i)'); 
    end
    [U,S,V]=svd(k);
    m=reshape(V(:,end),3,3)';
    [U,S,V]=svd(m);
    S(3,3)=0; %Assuming the value is too small theoretically
    m=U*S*V';
    m=t2'*m*t1; %verifying fundamental matrix
    m=m/m(end);
    if m(end)<0
        fmat=-m;
    else
        fmat=m;
    end
end