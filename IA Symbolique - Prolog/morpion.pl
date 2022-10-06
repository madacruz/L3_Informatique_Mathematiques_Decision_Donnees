% morpion 5x5

% condition pour gagner (win), on a 3 cas,
% gagner en ligne : rwin pour row winning), cwin colonne et
% dwin=diagonale

win(Brd, Plyr) :- rwin(Brd, Plyr) ;
                  cwin(Brd, Plyr) ;
                  dwin(Brd, Plyr) .

rwin(Brd, Plyr) :- Brd = [Plyr,Plyr,Plyr,Plyr,Plyr,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_];
                         [_,_,_,_,_,Plyr,Plyr,Plyr,Plyr,Plyr,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_];
                         [_,_,_,_,_,_,_,_,_,_,Plyr,Plyr,Plyr,Plyr,Plyr,_,_,_,_,_,_,_,_,_,_];
                         [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Plyr,Plyr,Plyr,Plyr,Plyr,_,_,_,_,_];
                         [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Plyr,Plyr,Plyr,Plyr,Plyr].

cwin(Brd, Plyr) :- Brd = [Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_];
                         [_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_];
                         [_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_];
                         [_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_];
                         [_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr,_,_,_,_,Plyr].

dwin(Brd, Plyr) :- Brd = [Plyr,_,_,_,_,_,Plyr,_,_,_,_,_,Plyr,_,_,_,_,_,Plyr,_,_,_,_,Plyr,_];
                         [_,_,_,_,Plyr,_,_,_,Plyr,_,_,_,Plyr,_,_,_,Plyr,_,_,_,Plyr,_,_,_,_].

% ------------------------------------------------------------------------
% -----------------------------------------------------------------------
% maintenant le plus pénible on définit le tableau(matrice) et les
% mouvements possibles, 5x5=25 j'ai pris les lettres donc de A à Y.
%
% omove et xmove, x pour le player Plyr, o pour le rond l'ordi qui joue.



omove([a,B,D,C,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [Plyr,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,a,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,Plyr,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,a,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,Plyr,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,a,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,Plyr,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,a,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,Plyr,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,D,C,E,a,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,Plyr,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,a,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,Plyr,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,a,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,Plyr,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,a,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,Plyr,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,a,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,Plyr,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,a,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,Plyr,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,a,M,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,Plyr,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,a,N,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,Plyr,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,a,O,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,Plyr,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,a,P,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,Plyr,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,a,Q,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,Plyr,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,a,R,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Plyr,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,a,S,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,Plyr,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,a,T,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,Plyr,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,a,U,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,Plyr,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,a,V,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,Plyr,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,a,W,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,Plyr,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,a,X,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,Plyr,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,a,Y], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,Plyr,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,a], Plyr, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Plyr]).

% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------


xmove([a,B,D,C,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 1, [x,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,a,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 2, [A,x,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,a,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 3, [A,B,x,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,a,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 4, [A,B,C,x,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,a,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 5, [A,B,C,D,x,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,D,C,E,a,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 6, [A,B,C,D,E,x,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,a,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 7, [A,B,C,D,E,F,x,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,a,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 8, [A,B,C,D,E,F,G,x,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,a,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 9, [A,B,C,D,E,F,G,H,x,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,a,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 10, [A,B,C,D,E,F,G,H,I,x,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,a,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 11, [A,B,C,D,E,F,G,H,I,J,x,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,a,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 12, [A,B,C,D,E,F,G,H,I,J,K,x,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,a,N,O,P,Q,R,S,T,U,V,W,X,Y], 13, [A,B,C,D,E,F,G,H,I,J,K,L,x,N,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,a,O,P,Q,R,S,T,U,V,W,X,Y], 14, [A,B,C,D,E,F,G,H,I,J,K,L,M,x,O,P,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,a,P,Q,R,S,T,U,V,W,X,Y], 15, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,x,P,Q,R,S,T,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,a,Q,R,S,T,U,V,W,X,Y], 16, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,x,Q,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,a,R,S,T,U,V,W,X,Y], 17, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,x,R,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,a,S,T,U,V,W,X,Y], 18, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,x,S,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,a,T,U,V,W,X,Y], 19, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,x,T,U,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,a,U,V,W,X,Y], 20, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,x,U,V,W,X,Y]).

xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,a,V,W,X,Y], 21, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,x,V,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,a,W,X,Y], 22, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,x,W,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,a,X,Y], 23, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,x,X,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,a,Y], 24, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,x,Y]).
xmove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,a], 25, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,x]).

xmove(Brd, _, Brd) :- write('illegal move !'), nl.

% -------------------------------------------------------------
% maintenant on affiche avec disp (display) notre matrice,
% 1er problème ça rend pas très joli, pcq j'ai mal cadré

disp([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]) :-
        write('|'),
        write([A,B,C,D,E]), write('|'), nl,
        write('|'),
        write([F,G,H,I,J]), write('|'), nl,        write('|'),
        write([K,L,M,N,O]), write('|'), nl,        write('|'),
        write([P,Q,R,S,T]), write('|'), nl,        write('|'),
        write([U,V,W,X,Y]), write('|'),nl,nl,nl,nl,nl.

go :- how_to_play, strt([a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a]).

how_to_play :-
    write('Vous êtes le x player, entrez vos positions suivies par un point.'),
    nl,
    disp([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]).

% et c'est la que ça plante pour des variables indéfinies, j comprends
% pas trop pourquoi ou alors j'ai oublié un bail tout bête.

strt(Brd) :- win(Brd, x), write('You win !').
strt(Brd) :- win(Brd, o), write('AI wins !').
strt(Brd) :- read(25),
        xmove(Brd, 25, NewBrd),
        disp(NewBrd),
        oplay(NewBrd, NewnewBrd),
        disp(NewnewBrd),
        strt(NewnewBrd).

can_x_win(Brd) :- omove(Brd, x, NewBrd), win(NewBrd, x).


oplay(Brd,NewBrd) :-
    omove(Brd, o, NewBrd),
    win(NewBrd, o),!.

oplay(Brd,NewBrd) :-
    omove(Brd, o, NewBrd),
    not(can_x_win(NewBrd)).

oplay(Brd,NewBrd) :-
    omove(Brd, o , NewBrd).

oplay(Brd,NewBrd) :-
    not(member(a,Brd)),!,
    write('Game ended without Winner!'), nl,
    NewBrd = Brd.

