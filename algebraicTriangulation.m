function X=algebraicTriangulation(x1,x2,P1,P2)
    x1=reshape(x1,3,56);
    x2=reshape(x2,3,56);
    P1=reshape(P1,3,4);
    P2=reshape(P2,3,4);
    
    %Find coordinates of reconstructed model.
    X=[];
    for i=1:56
        p1_x=x1(1,i);
        p2_x=x2(1,i);
        p1_y=x1(2,i);
        p2_y=x2(2,i);
        A=[p1_x*P1(3,1)-P1(1,1),p1_x*P1(3,2)-P1(1,2),p1_x*P1(3,3)-P1(1,3),p1_x*P1(3,4)-P1(1,4);
           p1_y*P1(3,1)-P1(2,1),p1_y*P1(3,2)-P1(2,2),p1_y*P1(3,3)-P1(2,3),p1_y*P1(3,4)-P1(2,4);
           p2_x*P2(3,1)-P2(1,1),p2_x*P2(3,2)-P2(1,2),p2_x*P2(3,3)-P2(1,3),p2_x*P2(3,4)-P2(1,4);
           p2_y*P2(3,1)-P2(2,1),p2_y*P2(3,2)-P2(2,2),p2_y*P2(3,3)-P2(2,3),p2_y*P2(3,4)-P2(2,4)];
        [U,S,V]=svd(A);
        X=[X;V(1:4,end)];
    end
    X=reshape(X,4,56);
end

