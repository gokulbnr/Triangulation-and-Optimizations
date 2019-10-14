function X = runTriangulation(P,img)
    %Find coordinates of reconstructed model.
    for i=1:56
        A=[];
        for j=1:8
            for k=1:2
                temp=[img(j,k,i)*P(j,3,1)-P(j,k,1),img(j,k,i)*P(j,3,2)-P(j,k,2),img(j,k,i)*P(j,3,3)-P(j,k,3),img(j,k,i)*P(j,3,4)-P(j,k,4)];
                A=[A;temp];
            end
        end
        [~,~,V]=svd(A);
        Coordinates_3D=V(1:4,end);
        X(:,i)=Coordinates_3D(1:4);   
    end
end