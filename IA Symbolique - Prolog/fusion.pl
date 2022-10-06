/*
  Projet d'IA : Morpion 5x5 avec deux modes de jeu :
    - 1 vs Ordinateur - La machine est un joueur.
    - 1 vs 1 - La machine est l'arbitre.
*/

/* A lancer pour commencer le jeu, cette commande va lancer choice(X), howToPlay et enfin le start du mode de jeu demande */
go :-
  choice(X),
  (
  /* X vaut 1, on lance le mode 1 vs 1*/
  (X=:=1, howToPlay, start([b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],x));
  /* X vaut 2, on lance le mode 1 vs Ordi*/
  (X=:=2, howToPlay, write('You are the x.\n'), start([b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]));
  /* X vaut n'importe quel autre entier on relance go */
  (X>2, write('Try again.\n'), go)
  ).

/* Clause pour le choix de gameplay */
choice(X) :-
  write('For a 1 vs 1 game, enter 1 followed by a dot.\n'),
  write('For a game against the machine, enter 2 followed by a dot.\n'),
  read(X).

/* Explique le fonctionnement et le but du jeu et affiche la grille vierge avec les positions avec lesquelles on peut jouer */
howToPlay :-
  write('The goal is to align 5 of your symbole either in rows, columns or diagonales.\n'),
  write('You play your symbole by entering an integer followed by a dot. It needs to be a two-didgit integer in which the first didgit represents the row and the second the column.\n'),
  write('For instance entering \'21.\' places your symbol on the square located at the second row and first column as you can see on the board below.\n'),
  /* Affiche la grille vierge avec les positions avec lesquelles on peut jouer */
  disp([11,12,13,14,15,21,22,23,24,25,31,32,33,34,35,41,42,43,44,45,51,52,53,54,55],0),
  write('Entering \'0.\' launches a new game\n\n').

/* Pour demander a l'utilisateur de rentrer la coordonnee de la case dans laquelle il veut jouer */
addInput(N) :-
  write('Enter your move followed by a dot:\n'),
  read(N).

/* Pour demander a l'utilisateur s'il souhaite faire une autre partie une partie lorsqu'une partie est terminee */
continueToPlay(N) :-
  write('Enter 1 followed by a dot to start a new game.\nEnter any other integer to stop.\n'),
  read(N),
  (
  /* Si N vaut 1 on relance une partie avec go */
  (N=:=1, go);
  /* Sinon on ne fait rien */
  (N=\=1)
  ).


/* Mode 1vOrdi - La machine est un joueur */
/* Victoire du joueur x */
start(Tab) :- win(Tab, x), write('You win !\n'), continueToPlay(_N).
/* Defaite du joueur x */
start(Tab) :- win(Tab, o), write('Game over !\n'), continueToPlay(_N).
/* La grille est remplie et il n'y pas de gagnant, egalite */
start(Tab) :- \+win(Tab, x), \+win(Tab, o), \+(member(b, Tab)), write('Cats game !\n'), continueToPlay(_N).
/* Personne n'a gagne et il reste de la place dans la grille */
start(Tab) :-
  write('It\'s your turn.\n'),
  addInput(N),
  /* Test pour savoir s'il faut lancer une nouvelle partie */
  (
  (N=:=0,write('Launching new game\n\n'),go);
  /* Sinon deroulement normal, on place la croix, on fait jouer la machine on affiche et on passe au tour suivant */
  (move(2, Tab, N, x, NewTab),
  disp(NewTab, 0),nl,
  write('It\'s the machine\'s turn.\n'),
  oplay(NewTab, NewNewTab),nl,
  disp(NewNewTab, 0),
  start(NewNewTab))
  ).

/* Gestion des coups de la machine */

/* Verifie si x peut gagner au prochain coup */
xCanWinInOne(Tab) :- move(Tab, x, NewTab), win(NewTab, x).

/* Joue le coup gagnant de la machine */
oplay(Tab, NewTab) :- move(Tab, o, NewTab), win(NewTab, o), !.
/* Joue un coup qui va bloquer l'adversaire */
oplay(Tab, NewTab) :- move(Tab, o, NewTab), \+(xCanWinInOne(NewTab)).
/* Joue un coup normal */
oplay(Tab, NewTab) :- move(Tab, o, NewTab).

/* Mouvements possibles de l'ordi */
move([b,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[Player,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,b,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,Player,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,b,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,Player,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,b,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,Player,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,b,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,Player,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move([A11,A12,A13,A14,A15,b,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,Player,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,b,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,Player,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,b,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,Player,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,b,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,Player,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,b,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,Player,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,b,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,Player,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,b,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,Player,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,b,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,Player,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,b,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,Player,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,b,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,Player,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,b,A42,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,Player,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,b,A43,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,Player,A43,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,b,A44,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,Player,A44,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,b,A45,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,Player,A45,A51,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,b,A51,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,Player,A51,A52,A53,A54,A55]).

move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,b,A52,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,Player,A52,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,b,A53,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,Player,A53,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,b,A54,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,Player,A54,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,b,A55],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,Player,A55]).
move([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,b],Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,Player]).

/* Mode 1v1 - Arbitre */
/* Pour pouvoir gerer le tour par tour */
turn(x, o).
turn(o, x).

/* Si qqun a gagne */
start(Tab, Player) :- win(Tab, Player), !, write('Player '), write(Player), write(' wins.\n'), continueToPlay(_N).
/* Si la grille est remplie et que personne n'a gagne, egalite */
start(Tab, Player) :- \+win(Tab, Player), \+member(b,Tab), write('Cats game !\n'), continueToPlay(_N).

/* Si personne n'a gagne et qu'il reste de la place dans la grille, on continue */
start(Tab, Player) :-
  write('It\'s player\'s '), write(Player), write(' turn.\n'),
  addInput(N), nl,
  /* Test pour savoir s'il faut lancer une nouvelle partie */
  (
  (N=:=0, write('Launching new game\n\n'), go);
  /* Sinon deroulement normal, on place le symbole du joueur, on affiche et on passe au tour suivant */
  (move(1, Tab, N, Player, NewTab),
  disp(NewTab, 0),
  turn(Player, NextPlayer),
  start(NewTab, NextPlayer))
  ).

/* Les differents mouvements possibles */
/* "signature" move(Tab, N, symboleDuJoueur, NouvTab) */

move(_,[b,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],11,Player,[Player,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,b,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],12,Player,[A11,Player,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,b,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],13,Player,[A11,A12,Player,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,b,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],14,Player,[A11,A12,A13,Player,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,b,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],15,Player,[A11,A12,A13,A14,Player,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move(_,[A11,A12,A13,A14,A15,b,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],21,Player,[A11,A12,A13,A14,A15,Player,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,b,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],22,Player,[A11,A12,A13,A14,A15,A21,Player,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,b,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],23,Player,[A11,A12,A13,A14,A15,A21,A22,Player,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,b,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],24,Player,[A11,A12,A13,A14,A15,A21,A22,A23,Player,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,b,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],25,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,Player,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,b,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],31,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,Player,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,b,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],32,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,Player,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,b,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],33,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,Player,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,b,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],34,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,Player,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,b,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],35,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,Player,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55]).

move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,b,A42,A43,A44,A45,A51,A52,A53,A54,A55],41,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,Player,A42,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,b,A43,A44,A45,A51,A52,A53,A54,A55],42,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,Player,A43,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,b,A44,A45,A51,A52,A53,A54,A55],43,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,Player,A44,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,b,A45,A51,A52,A53,A54,A55],44,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,Player,A45,A51,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,b,A51,A52,A53,A54,A55],45,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,Player,A51,A52,A53,A54,A55]).

move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,b,A52,A53,A54,A55],51,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,Player,A52,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,b,A53,A54,A55],52,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,Player,A53,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,b,A54,A55],53,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,Player,A54,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,b,A55],54,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,Player,A55]).
move(_,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,b],55,Player,[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,Player]).

/* Detecte les coups illegaux */
/* Si le coup est illegal, le tour du joueur est passe */
move(1,Tab,_,Player,Tab) :- write('Illegal move.\n'), start(Tab,Player).
move(2,Tab,_,_,Tab) :- write('Illegal move.\n'), start(Tab).


/* Pour afficher la grille */
/* On utilise un systeme de  modulo pour afficher la grille
  car on s'est dit que c'est ce qui etait le plus facilement adaptable
  si on decide de changer la taille de la grille */
/* On utilise 'is' pour instancier une valuer a une variable */
/* Si la case a afficher n'est pas a la fin d'un rang; nth0(i,x,y) i = position, x = tableau, y = element */
disp(Tab, I) :- mod(I,5)=\=4, nth0(I, Tab, Player), write(' '), write(Player), write(' |'), J is I+1, disp(Tab,J).
/* Si la case a afficher est la derniere de la la ligne, mais pas le dernier element de la liste */
disp(Tab, I) :- mod(I,5)=:=4, I=\=24, nth0(I, Tab, Player), write(' '), write(Player), nl, J is I+1, disp(Tab,J).
/* Si la case a afficher est le dernier element de la liste */
disp(Tab, I) :- I=:=24, nth0(I, Tab, Player), write(' '), write(Player), nl, nl, !.


/* Conditions de victoire: 5 symboles alignes soit en ligne, soit en colonnes, soit en diagonale */
win(Tab, Player) :- rowWin(Tab, Player).
win(Tab, Player) :- colWin(Tab, Player).
win(Tab, Player) :- diagWin(Tab, Player).

/* Differents cas de victoires par symboles alignes par lignes */
rowWin(Tab, Player) :- Tab = [Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
rowWin(Tab, Player) :- Tab = [_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].
rowWin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_,_,_,_,_,_].
rowWin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player,_,_,_,_,_].
rowWin(Tab, Player) :- Tab = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Player,Player,Player,Player,Player].

/* Differents cas de victoires par symboles alignes par colonnes */
colWin(Tab, Player) :- Tab = [Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_].
colWin(Tab, Player) :- Tab = [_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_].
colWin(Tab, Player) :- Tab = [_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_].
colWin(Tab, Player) :- Tab = [_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_].
colWin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player,_,_,_,_,Player].

/* Differents cas de victoires par symboles alignes en diagonale */
diagWin(Tab, Player) :- Tab = [Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player,_,_,_,_,_,Player].
diagWin(Tab, Player) :- Tab = [_,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,Player,_,_,_,_].
