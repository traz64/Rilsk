twod=zeros(10,100000);
for k=1:10
    for i=1:100000
        ctd=k;
        ulostt=0;
        while ctd>0
            if ctd==1
                att=randi(6,1,3);
                def=randi(6);
                if max(att)>def
                    ctd=ctd-1;
                else
                    ulostt=ulostt+1;
                end
            else
                att=sort(randi(6,1,3),'descend');
                def=sort(randi(6,1,2),'descend');
                for j=1:2
                    if att(j)>def(j)
                        ctd=ctd-1;
                    else
                        ulostt=ulostt+1;
                    end
                end
            end
        end
        twod(k,i)=ulostt;
    end
end
stem(1:10,mean(twod,2))