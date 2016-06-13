function bonus= turnstart(player,boardstate,pieces)
terrown=boardstate==player;
contown=sum(terrown)==[9,4,7,6,12,4];
bonus=max([floor(mod(nnz(terrown),3)),3])+(sum(contown.*[5,2,5,3,7,2]));
riskscore(boardstate,pieces);
end
