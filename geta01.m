function [img,P]=geta01()
    %Intrinsic Parameter
    K=[100,0,50;0,100,100;0,0,1];

    %Sub-part 1
    %Forming all homogenous matrices
    Hom=[];
    for i = 0:7
        ang=(pi*(i+2))/4;
        Hom=cat(3,Hom,[cos(ang),0,sin(ang),0;0,1,0,0;-sin(ang),0,cos(ang),25;0,0,0,1]);
    end

    %World coordinates of the cube
    wcoord=generateCube(4,4);

    %Finding camera coordinates from world coordinates
    ccoord=[];
    for i=1:size(wcoord,2)
        temp=[];
        for j =1:8
            temp=[temp;(Hom(:,:,j)*[wcoord(:,i);1])'];
        end
        ccoord=cat(3,ccoord,temp(:,1:3));
    end

    %Finding image coordinates from camera coordinates
    icoord=[];
    for i =1:size(ccoord,1)
        temp2=[];
        for j=1:size(ccoord,3)
            temp=(K*(ccoord(i,:,j))');
            temp=(temp/temp(3,1))';
            temp=temp(:,1:2);
            temp2=cat(3,temp2,temp);
        end
        icoord=[icoord;temp2];
    end

    img=[];
    for i=1:8
        img(i,:,:)=[reshape(icoord(i,:,:),2,56);ones(1,56)];
    end

    %Finding fundamental and essential matrices
    fRANSAC=ransac(img(1,:,:),img(2,:,:));
    E=transpose(K)*fRANSAC*K;

    %Sub-part 2
    [R,t]=decomposeEssentialMatrix( E,img(1,:,:),img(2,:,:),K);

    %Sub-part 3
    P=[];
    P(2,:,:)=K*cat(2,R,t);
    P(1,:,:)=K*[eye(3),[0;0;0]];
    twcoord(1,:,:)=algebraicTriangulation(img(1,:,:),img(2,:,:),P(1,:,:),P(2,:,:));

    %Sub-part 4
    for i=3:8
        P(i,:,:)=resection(twcoord(1,:,:),img(i,:,:));
    end
end