function [piecesatt,piecesdef,terflip]=attack(astr,dstr)
        while dstr>0&&astr>2
            if dstr==1
                switch astr
                    case 3
                        att=randi(6,1,2);
                    case 2
                        att=randi(6);
                    otherwise
                        att=randi(6,1,3);
                end
                def=randi(6);
                if max(att)>def
                    dstr=dstr-1;
                else
                    astr=astr-1;
                end
            else              
                 switch astr
                    case 3
                        att=sort(randi(6,1,2),'descend');
                        def=sort(randi(6,1,2),'descend');
                    case 2
                        att=randi(6);
                        def=randi(6);
                     otherwise
                        att=sort(randi(6,1,3),'descend');
                        def=sort(randi(6,1,2),'descend');
                 end

                for j=1:numel(def)
                    if att(j)>def(j)
                        dstr=dstr-1;
                    else
                        astr=astr-1;
                    end
                end
            end
        end
        if dstr<1
            terflip=1;
            piecesdef=astr-1;
            piecesatt=1;
        else
            terflip=0;
            piecesatt=astr;
            piecesdef=dstr;
        end
end
