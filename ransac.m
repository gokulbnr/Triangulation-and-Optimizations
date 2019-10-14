function fmat=ransac(p1,p2)
    p1=reshape(p1,3,56);
    p2=reshape(p2,3,56);
    [~,n,~]=size(p1);

    th=0.02;
    p=0.99;
    e=0.66;
    s=8;
    iter=log(1-p)/log(1-(1-e).^s);
    
    maxin=0;
    ind=[];
    
    for i=1:iter
        rin=randperm(n,8);
        tempfmat=estimateFundamentalMatrix(p1(:,rin),p2(:,rin));
        
        mcou=-0;
        mind=[];
        
        for j=1:n
            if(abs(p2(:,j)'*tempfmat*p1(:,j))<th)
                mcou=mcou+1;
                mind=[mind;j];
            end
        end
        
        if(mcou==n)
            maxin=n;
            ind=mind;
            break;
        end
        
        if(mcou>maxin)
            maxin=mcou;
            ind=mind;
        end 
    end
    
    in1=p1(:,ind);
    in2=p2(:,ind);
    fmat=estimateFundamentalMatrix(in1,in2);
end
