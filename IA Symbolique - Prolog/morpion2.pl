% morpion 5x5

% condition pour gagner (win), on a 3 cas,
% gagner en ligne : linewin ), colwin colonne et
% diagwin=diagonale



win(Tab, Player) :- linewin(Tab, Player).
win(Tab, Player) :- colwin(Tab, Player).
win(Tab, Player) :- diagwin(Tab, Player).

linewin(Tab, Player) :- Tab = [Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player].

colwin(Tab, Player) :- Tab = [Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_].
colwin(Tab, Player) :- Tab = [_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_].
colwin(Tab, Player) :- Tab = [_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_].
colwin(Tab, Player) :- Tab = [_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_].
colwin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player].

diagwin(Tab, Player) :- Tab = [Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player].     %1 7 13 19 25
diagwin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,_].     %5 9 13 17 21

choix(x,o).
choix(o,x).

game(Tab, Player) :- win(Tab, Player), !, write([player, Player, wins]).
game(Tab, Player) :-
  choix(Player,Choixplayer),
  move(Tab,Player,NewTab),
  !,
  disp(NewTab),nl,nl,
  game(NewTab,Choixplayer).

move([b,B,D,C,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [Player,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,b,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,Player,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,b,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,Player,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,b,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,Player,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,b,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,Player,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

move([A,B,D,C,E,b,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,Player,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,b,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,Player,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,b,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,Player,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,b,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,Player,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,b,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,Player,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

move([A,B,C,D,E,F,G,H,I,J,b,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,Player,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,b,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,Player,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,b,N,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,Player,N,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,b,O,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,Player,O,P,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,b,P,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,Player,P,Q,R,S,T,U,V,W,X,Y]).

move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,b,Q,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,Player,Q,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,b,R,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Player,R,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,b,S,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,Player,S,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,b,T,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,Player,T,U,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,b,U,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,Player,U,V,W,X,Y]).

move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,b,V,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,Player,V,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,b,W,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,Player,W,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,b,X,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,Player,X,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,b,Y], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,Player,Y]).
move([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,b], Player, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Player]).

/* display([A,B,C,D,E,F,G,H,I]) :- write([A,B,C]),nl,write([D,E,F]),nl,
 write([G,H,I]),nl,nl.  */
disp([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]) :-
    write('| '),write(A),write(' | '),write(B),write(' | '),write(C),write(' | '),write(D),write(' | '),write(E),write(' |'),nl,
    write('| '),write(F),write(' | '),write(G),write(' | '),write(H),write(' | '),write(I),write(' | '),write(J),write(' |'),nl,
    write('| '),write(K),write(' | '),write(L),write(' | '),write(M),write(' | '),write(N),write(' | '),write(O),write(' |'),nl,
    write('| '),write(P),write(' | '),write(Q),write(' | '),write(R),write(' | '),write(S),write(' | '),write(T),write(' |'),nl,
    write('| '),write(U),write(' | '),write(V),write(' | '),write(W),write(' | '),write(X),write(' | '),write(Y),write(' |'),nl.

toutseul:- game([b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],x).

x_can_win_in_one(Tab) :- move(Tab, x, NewTab), win(NewTab, x).

oplay(Tab,NewTab) :-
  move(Tab, o, NewTab),
  win(NewTab, o),
  !.
oplay(Tab,NewTab) :-
  move(Tab, o, NewTab),
  not(x_can_win_in_one(NewTab)).
oplay(Tab,NewTab) :-
  move(Tab, o, NewTab).
oplay(Tab,NewTab) :-
  not(member(b,Tab)),
  !,
  write('Cats game!'), nl,
  NewTab = Tab.

xmove([b,B,D,C,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 10, [x,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,b,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 11, [A,x,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,b,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 12, [A,B,x,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,b,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 13, [A,B,C,x,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,b,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 14, [A,B,C,D,x,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,D,C,E,b,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 15, [A,B,C,D,E,x,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,b,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 16, [A,B,C,D,E,F,x,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,b,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 17, [A,B,C,D,E,F,G,x,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,b,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 18, [A,B,C,D,E,F,G,H,x,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,b,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 19,[A,B,C,D,E,F,G,H,I,x,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,b,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 20,[A,B,C,D,E,F,G,H,I,J,x,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,b,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 21,[A,B,C,D,E,F,G,H,I,J,K,x,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,b,N,O,P,Q,R,S,T,U,V,W,X,Y], 22,[A,B,C,D,E,F,G,H,I,J,K,L,x,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,b,O,P,Q,R,S,T,U,V,W,X,Y], 23,[A,B,C,D,E,F,G,H,I,J,K,L,M,x,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,b,P,Q,R,S,T,U,V,W,X,Y], 24,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,x,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,b,Q,R,S,T,U,V,W,X,Y], 25,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,x,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,b,R,S,T,U,V,W,X,Y], 26,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,x,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,b,S,T,U,V,W,X,Y], 27,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,x,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,b,T,U,V,W,X,Y], 28,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,x,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,b,U,V,W,X,Y], 29,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,x,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,b,V,W,X,Y], 30,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,x,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,b,W,X,Y], 31,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,x,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,b,X,Y], 32,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,x,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,b,Y], 33,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,x,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,b], 34,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,x]).

xmove(Tab, _, Tab) :- write('Illegal move.'), nl.

go :- how_to_play, strt([b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]).

how_to_play :-
  write('You play X by entering integer positions followed by a period.'),
  nl,
  disp([10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]).

strt(Tab) :- win(Tab, x), write('You win!').
strt(Tab) :- win(Tab, o), write('I win!').
strt(Tab) :- read(N),
  xmove(Tab, N, NewTab),
  disp(NewTab),nl,
  oplay(NewTab, NewnewTab),nl,
  disp(NewnewTab),
  strt(NewnewTab).
