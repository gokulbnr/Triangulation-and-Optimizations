function P = resection(X,p)
    X=reshape(X,4,56);
    for i=1:56
        X(:,i)=X(:,i)./X(4,i);
    end
    pts1=reshape(p,3,56);
    A=[];
    for i=1:56
        x=[-1*(X(1,i)),-1*(X(2,i)),-1*(X(3,i)),-1,0,0,0,0,pts1(1,i)*X(1,i),pts1(1,i)*X(2,i),pts1(1,i)*X(3,i),pts1(1,i)];
        y=[0,0,0,0,-1*(X(1,i)),-1*(X(2,i)),-1*(X(3,i)),-1,pts1(2,i)*X(1,i),pts1(2,i)*X(2,i),pts1(2,i)*X(3,i),pts1(2,i)];
        A=[A;x;y];
    end
    [~,~,V]=svd(A);
    P=reshape(V(:,end),4,3)';
    P=P/P(3,4);
end
