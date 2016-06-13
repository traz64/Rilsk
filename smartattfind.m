function [attfrom,attloc]=smartattfind(turn,pieces,terown,attmat,odds,values,ternum)
attloc=[];
attfrom=[];
attvalue=0;
contbon=zeros(1,6);
contclose=zeros(1,6);
contsize=[9,4,7,6,12,4];
contbonus=[1.714285714285714,1.285714285714286,1.714285714285714,1.428571428571429,2,1.285714285714286];
%logic for continent near or at completion
for x=1:6
    if nnz(terown(:,x)==turn)==contsize(x)
        contbon(x)=1;
    elseif nnz(terown(:,x)==turn)==contsize(x)-1
        contclose(x)=1;
    end
end
for q=find(terown==turn)'  %for each territory player owns
    if pieces(q)>2
        for i=attmat{q}
            k=find(ternum==i);
            %logic for continent attack weighting bonus
            x=ceil(k/12);
            if contbon(x)
                contincetive=contbonus(x);
            elseif contclose(x)
                if attmat{k}==turn
                    contincetive=contbonus(x)*1.5;
                else
                    contincetive=contbonus(x)*.75;
                end
            else
                contincetive=1;
            end
            
            if terown(k)~=turn && (pieces(q)>100||pieces(k)>100||(odds(pieces(q),pieces(k))*contincetive>.5))    % find if it should make an attack at absolute 
                try
                    value=odds(pieces(q),pieces(k))*contincetive*values(k);
                catch
                    value =5000;
                end
                if value>attvalue                         %pick best attack
                    attloc=k;
                    attfrom=q;
                    attvalue=value;                
                end
            end
        end
    end
end
