function varargout=riskmain(allai)
load('map.mat')
load('weightmat.mat')
terown=zeros(size(ternum));
pieces=zeros(size(ternum));
starting=randperm(42);
terhist=zeros(12,6,100);
for q = find(ternum)' % inital ownership
    terown(q)=ceil(starting(ternum(q))/7);
    pieces(q)=1;% all spaces have starting unit
end
%simple random inital distribution (no AI)
if nargin==0
    allai=[0,0,0,0,0,0];
end
pieces=distruibute(1,13,pieces,terown,attmat,0);
pieces=distruibute(2,13,pieces,terown,attmat,0);
pieces=distruibute(3,13,pieces,terown,attmat,0);
pieces=distruibute(4,13,pieces,terown,attmat,0);
pieces=distruibute(5,13,pieces,terown,attmat,0);
pieces=distruibute(6,13,pieces,terown,attmat,0);
riskscore(terown,pieces);
turn=1;
round=0;%for weighting
%end setup
while ~((nnz(terown==1)==42)||(nnz(terown==2)==42)||(nnz(terown==3)==42)||(nnz(terown==4)==42)||(nnz(terown==5)==42)||(nnz(terown==6)==42))
    %while game not over
    if nnz(terown==turn)
        pieces=distruibute(turn,turnstart(turn,terown,pieces),pieces,terown,attmat,allai(turn));
        while(1);
              [q,validatt]=smartattfind(turn,pieces,terown,attmat,odds,weightmat,ternum);
                    if ~isempty(validatt)
                        [pieces(q),pieces(validatt),terswitch]=attack(pieces(q),pieces(validatt));
                        if terswitch
                            terown(validatt)=turn;          %if territory changes hands
                            %if nargout<1
                            %    disp(['Player ',num2str(turn),' takes ',tername(validatt)])
                            %end
                        
                        end
                    else
                        break
                    end
        end
    end
    if turn==6
        turn=1;
        round=round+1;
        if round<=100
            terhist(:,:,round)=terown;
        end
    else
        turn=turn+1;
    end
end
winner=terown(1);
weightmat=adaptiveweighting(weightmat,winner,terhist,round);
disp(['the winner is player ' num2str(winner) ' with ai mode ' num2str(allai(winner)) ' on round ' num2str(round)])
switch nargout
    case 0
    case 1
        varargout{1}=winner;
    case 2
        varargout{1}=winner;
        varargout{2}=allai(winner);
    case 3
        varargout{1}=winner;
        varargout{2}=round;
        varargout{3}=terhist;
    otherwise
        error('too many outputs')
end