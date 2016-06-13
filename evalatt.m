function yn=evalatt(aforce,dforce)
if (aforce>dforce)||((aforce>4)&&(aforce==dforce))
    yn=1;
elseif dforce>10
    winodd=zeros(100,1);
    for i=1:100
        winodd(i)=attack(aforce,dforce);
    end
    if nnz(winodd)>50
        yn=1;
    else
        yn=0;
    end
else
    yn=0;
end
end
