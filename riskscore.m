function riskscore(owns,pieces)
p1s=nnz(owns==1)*4+sum(sum(pieces.*(owns==1)*3));
p2s=nnz(owns==2)*4+sum(sum(pieces.*(owns==2)*3));
p3s=nnz(owns==3)*4+sum(sum(pieces.*(owns==3)*3));
p4s=nnz(owns==4)*4+sum(sum(pieces.*(owns==4)*3));
p5s=nnz(owns==5)*4+sum(sum(pieces.*(owns==5)*3));
p6s=nnz(owns==6)*4+sum(sum(pieces.*(owns==6)*3));
scores=[p1s,p2s,p3s,p4s,p5s,p6s];
end
