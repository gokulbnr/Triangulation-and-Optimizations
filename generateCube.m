function cube_pts_world=generateCube(n,a)
    num=(2*(n-2)*(n-2)+2*(n-2)*(n)+2*n*n);
    cube_pts_world=zeros(3,num);
    temp1=zeros(1,n);
    temp2=zeros(1,2);
    temp2(1)=(-1*a)/2;
    temp2(2)=a/2;
    for i=1:n
        temp1(i)=((i-1)*a)/(n-1)-(a/2);
    end
      
            %Bottom Face - Layer 1
            for i=1:n
                cube_pts_world(1,(i-1)*n+1:i*n)=temp1(:);
                cube_pts_world(2,(i-1)*n+1:i*n)=repmat((((i-1)*a)/(n-1)-(a/2)),1,n);
                cube_pts_world(3,(i-1)*n+1:i*n)=repmat((-0.5*a),1,n);
            end
           
             %Top Face - Layer n
             for i=1:n
                 cube_pts_world(1,n*n+(i-1)*n+1:n*n+i*n)=temp1(:);
                 cube_pts_world(2,n*n+(i-1)*n+1:n*n+i*n)=repmat((((i-1)*a)/(n-1)-(a/2)),1,n);
                 cube_pts_world(3,n*n+(i-1)*n+1:n*n+i*n)=repmat((0.5*a),1,n);
             end

         count=2*n*n;
         %Layers 2 to n-1
         for i=2:n-1
              cube_pts_world(1,count+1:count+n)=temp1(:);
              cube_pts_world(2,count+1:count+n)=repmat(0.5*a,1,n);
              cube_pts_world(3,count+1:count+n)=repmat((-0.5*a+(i-1)*a/(n-1)),1,n);
              count=count+n;            

             for j=2:n-1
                 cube_pts_world(1,count+1:count+2)=temp2(:);
                 cube_pts_world(2,count+1:count+2)=repmat(-0.5*a+(j-1)*a/(n-1),1,2);
                 cube_pts_world(3,count+1:count+2)=repmat((-0.5*a+(i-1)*a/(n-1)),1,2);
                 count=count+2;
             end
             
              cube_pts_world(1,count+1:count+n)=temp1(:);
              cube_pts_world(2,count+1:count+n)=repmat(-0.5*a,1,n);
              cube_pts_world(3,count+1:count+n)=repmat((-0.5*a+(i-1)*a/(n-1)),1,n);
              count=count+n;            
         end
end