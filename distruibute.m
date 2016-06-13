function pieces=distruibute(player,bonus,pieces,terown,attmat,ai)
if nargin<6
    ai=0;
end

terowned=find(terown==player)';
switch ai
    case 0      %random
        for i=1:bonus
            loc=terowned(randi(numel(terowned))); %randomly select an owned territory
            pieces(loc)=pieces(loc)+1;
        end
    case 1      %random border
        valter=[];
        for i=terowned
            for j=attmat{i}
                if nnz(terown(j)~=player) %if surrouding territories not owned by player
                    valter=[valter i];
                    break
                end
            end
        end
        for i=1:bonus
            loc=valter(randi(numel(valter))); %randomly select an owned border territory
            pieces(loc)=pieces(loc)+1;
        end
    case 2      %2 then random border
        for i=terowned
            if pieces(i)==1&&bonus>0
                pieces(i)=pieces(i)+1;
                bonus=bonus-1;
            end
        end
        if bonus>0 %random border if still has pieces
            valter=[];
            for i=terowned
                for j=attmat{i}
                    if nnz(terown(j)~=player) %if surrouding territories not owned by player
                        valter=[valter i];
                        break
                    end
                end
            end
            for i=1:bonus
                loc=valter(randi(numel(valter))); %randomly select an owned border territory
                pieces(loc)=pieces(loc)+1;
            end
        end
end


end