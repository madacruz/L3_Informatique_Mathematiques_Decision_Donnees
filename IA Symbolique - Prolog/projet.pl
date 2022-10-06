/*
  Projet d'IA : Morpion 5x5 avec deux options de jeu
    - 1 vs Ordinateur
    - 1 vs 1
*/

/* A lancer pour commencer le jeu, cette commande va lancer how_to_play et strt(Tab)*/
go :-
  how_to_play,
  strt([-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-],x).

/* Explique le fonctionnement et le but du jeu et affiche la grille vierge */
how_to_play :-
  write('You play X by entering integer for the row and the column followed by a dot.'),
  nl,
  write('The goal is to align 5 of your symbole either in rows, columns or diagonales.'),
  nl,
  /* Affiche la grille vierge */
  disp([-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-],0).

/* Pour pouvoir gérer le tour par tour */
turn(x,o).
turn(o,x).

/* Si qqun a gagné */
strt(Tab,Player) :- win(Tab, Player), !, write('Player '),write(Player), write(' wins.'),nl.

/* Si personne ne gagne, on lance  */
strt(Tab,Player) :-
  write('It\'s player\'s '), write(Player), write(' turn.'), nl,
  addInput(X,Y), nl,
  move(Tab, X, Y, Player, NewTab),
  disp(NewTab,0),
  turn(Player,NextPlayer),
  strt(NewTab,NextPlayer).



/* Pour demander à l'utilisateur de rentrer les coordonnées de la case dans laquelle il veut jouer */
addInput(I,J) :-
  write('Enter row number followed by a dot:\n'),
  read(I),
  write('Enter column number followed by a dot:\n'),
  read(J).

  /* Les différents mouvements possibles */
  /* "signature" move(Tab, X, Y, symboleDuJoueur, NouvTab) */
  move([_,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,1,Player,[Player,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,_,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,2,Player,[A11,Player,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,_,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,3,Player,[A11,A12,Player,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,_,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,4,Player,[A11,A12,A13,Player,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,_,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,5,Player,[A11,A12,A13,A14,Player,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

  move([A11,A12,A13,A14,A15,_,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,1,Player,[A11,A12,A13,A14,A15,Player,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,_,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,2,Player,[A11,A12,A13,A14,A15,A21,Player,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,_,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,3,Player,[A11,A12,A13,A14,A15,A21,A22,Player,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,_,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,4,Player,[A11,A12,A13,A14,A15,A21,A22,A23,Player,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,_,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,5,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,Player,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,_,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,1,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,Player,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,_,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,2,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,Player,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,_,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,3,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,Player,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,_,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,4,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,Player,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,_,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,5,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,Player,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,_,A42,A43,A44,A45,A51,A52,A53,A54,A55],4,1,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,Player,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,_,A43,A44,A45,A51,A52,A53,A54,A55],4,2,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,Player,A43,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,_,A44,A45,A51,A52,A53,A54,A55],4,3,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,Player,A44,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,_,A45,A51,A52,A53,A54,A55],4,4,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,Player,A45,A51,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,_,A51,A52,A53,A54,A55],4,5,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,Player,A51,A52,A53,A54,A55]).

  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,_,A52,A53,A54,A55],5,1,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,Player,A52,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,_,A53,A54,A55],5,2,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,Player,A53,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,_,A54,A55],5,3,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,Player,A54,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,_,A55],5,4,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,Player,A55]).
  move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,_],5,5,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,Player]).

  move(Tab,_ ,_ ,Player, NewTab) :- write('Illegal move.'), nl.

/*
  Conditions de victoire: 5 symboles alignés soit en ligne, soit en colonnes, soit en diagonale
*/
win(Tab, Player) :- linewin(Tab, Player).
win(Tab, Player) :- colwin(Tab, Player).
win(Tab, Player) :- diagwin(Tab, Player).

/* Différents cas de victoires par symboles alignés par lignes */
linewin(Tab, Player) :- Tab = [Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_].
linewin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player].

/* Différents cas de victoires par symboles alignés par colonnes */
colwin(Tab, Player) :- Tab = [Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_].
colwin(Tab, Player) :- Tab = [_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_].
colwin(Tab, Player) :- Tab = [_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_].
colwin(Tab, Player) :- Tab = [_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_].
colwin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player].

/* Différents cas de victoires par symboles alignés en diagonale */
diagwin(Tab, Player) :- Tab = [Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player].
diagwin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,_].


/* Pour afficher la grille */

/* Si la case à afficher n'est pas à la fin d'un rang; nth0(i,x,y) i = position, x = grille, y = valeur/symbole du joueur (x;o)*/
disp(Tab,I) :- mod(I,5)=\=4, nth0(I,Tab,Player), write(' '), write(Player), write(' |'), J is I+1, disp(Tab,J).
/* Si la case à afficher est la drenière de la la ligne, mais pas le dernier élément de la liste */
disp(Tab,I) :- mod(I,5)=:=4, I=\=24, nth0(I,Tab,Player), write(' '), write(Player), nl, J is I+1, disp(Tab,J).
/* Si la case à afficher est le dernier élément de la liste */
disp(Tab,I) :- I=:=24, nth0(I,Tab,Player), write(' '), write(Player), nl, nl, !.


/* Partie propre à 1 v Ordi*/

/* Vérifie si x peut gagner en un coup */
x_can_win_in_one(Tab) :- move(Tab, _I, _J, x, NewTab), win(NewTab, x).

/* Mouvements de l'ordinateur */
oplay(Tab,NewTab) :-
  omove(Tab, o, NewTab),
  win(NewTab, o),
  !.

oplay(Tab,NewTab) :-
  omove(Tab, o, NewTab),
  not(x_can_win_in_one(NewTab)).

oplay(Tab,NewTab) :-
  omove(Tab, o, NewTab).

oplay(Tab,NewTab) :-
  not(member(b,Tab)),
  !,
  write('Cats game!'), nl,
  NewTab = Tab.

omove([_,B,D,C,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 1, [o,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,_,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 2, [A,o,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,_,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 3, [A,B,o,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,_,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 4, [A,B,C,o,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,_,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 5, [A,B,C,D,o,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,D,C,E,_,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 6, [A,B,C,D,E,o,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,_,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 7, [A,B,C,D,E,F,o,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,_,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 8, [A,B,C,D,E,F,G,o,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,_,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 9, [A,B,C,D,E,F,G,H,o,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,_,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 10,[A,B,C,D,E,F,G,H,I,o,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,_,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 11,[A,B,C,D,E,F,G,H,I,J,o,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,_,M,N,O,P,Q,R,S,T,U,V,W,X,Y], 12,[A,B,C,D,E,F,G,H,I,J,K,o,M,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,_,N,O,P,Q,R,S,T,U,V,W,X,Y], 13,[A,B,C,D,E,F,G,H,I,J,K,L,o,N,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,_,O,P,Q,R,S,T,U,V,W,X,Y], 14,[A,B,C,D,E,F,G,H,I,J,K,L,M,o,O,P,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,_,P,Q,R,S,T,U,V,W,X,Y], 15,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,o,P,Q,R,S,T,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,_,Q,R,S,T,U,V,W,X,Y], 16,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,o,Q,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,_,R,S,T,U,V,W,X,Y], 17,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,o,R,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,_,S,T,U,V,W,X,Y], 18,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,o,S,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,_,T,U,V,W,X,Y], 19,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,o,T,U,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,_,U,V,W,X,Y], 20,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,o,U,V,W,X,Y]).

omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,_,V,W,X,Y], 21,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,o,V,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,_,W,X,Y], 22,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,o,W,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,_,X,Y], 23,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,o,X,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,_,Y], 24,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,o,Y]).
omove([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,_], 25,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,o]).

omove(Tab, _, Tab) :- write('Illegal move.'), nl.
