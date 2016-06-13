%control=zeros(1,6000);
test=zeros(1,6000);
round=zeros(1,6000);
tervalues=zeros(12,6,100,6000);
for i=1:6000
%    control(i)=riskmain;
    [test(i),round(i),tervalues(:,:,:,i)]=riskmain([2 2 2 2 2 2]);
    waitbar(i/6000)
end
x=[1 2 3 4 5 6];
%y1=[nnz(control==1),nnz(control==2),nnz(control==3),nnz(control==4),nnz(control==5),nnz(control==6)]';
y2=[nnz(test==1),nnz(test==2),nnz(test==3),nnz(test==4),nnz(test==5),nnz(test==6)]';
bar(x,y2)