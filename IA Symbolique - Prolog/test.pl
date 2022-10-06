
% Start the game
:-initialization(play).

/*
* To start the game with the blank board, turn number 1, and move number 1
*/
play:- write('\n'),playHelp([-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-],1,1).

/*
* To display the board
*/
% If the position being displayed is not the last in a row
%                           nth0(i,x,y) i = position, x = grille, y = valeur/symbole du joueur (x;o)
bdisplay(X,I):-mod(I,5)=\=0,nth0(I,X,Y),write(' '),write(Y),write(' |'),J is I+1,bdisplay(X,J).
% If the position being displayed is the last in a row, but not the last element
bdisplay(X,I):-mod(I,5)=:=0,I=\=25,nth0(I,X,Y),write(' '),write(Y),nl,J is I+1,bdisplay(X,J).
% If the position being displayed is the last element
bdisplay(X,I):-I=:=25,nth0(I,X,Y),write(' '),write(Y),nl,nl,!.

/*
* To accept input from the user, and store the value Y in position (I,J) in NX, the modified
* list of X
*/
addInputUser(X,Y,NX):-write('Enter row number:\n'),read(I),write('Enter column number:\n'),read(J),changeList(X,I,J,Y,NX).

/*
* To change the (I,J)th value of the list with Y and bind it to NX
*/
changeList([_,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,1,Y,NX)
:-NX=[Y,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,_,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,2,Y,NX)
:-NX=[A11,Y,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,_,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,3,Y,NX)
:-NX=[A11,A12,Y,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,_,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,4,Y,NX)
:-NX=[A11,A12,A13,Y,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,_,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],1,5,Y,NX)
:-NX=[A11,A12,A13,A14,Y,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].

changeList([A11,A12,A13,A14,A15,_,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,1,Y,NX)
:-NX=[A11,A12,A13,A14,A15,Y,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,_,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,2,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,Y,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,_,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,3,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,Y,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,_,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,4,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,Y,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,_,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],2,5,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,Y,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].

changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,_,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,1,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,Y,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A21,A13,A14,A15,A21,A22,A23,A24,A25,A31,_,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,2,Y,NX)
:-NX=[A11,A21,A13,A14,A15,A21,A22,A23,A24,A25,A31,Y,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,_,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,3,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,Y,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,_,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,4,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,Y,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,_,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55],3,5,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,Y,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55].

changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,_,A42,A43,A44,A45,A51,A52,A53,A54,A55],4,1,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,Y,A42,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,_,A43,A44,A45,A51,A52,A53,A54,A55],4,2,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,Y,A43,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,_,A44,A45,A51,A52,A53,A54,A55],4,3,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,Y,A44,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,_,A45,A51,A52,A53,A54,A55],4,4,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,Y,A45,A51,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,_,A51,A52,A53,A54,A55],4,5,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,Y,A51,A52,A53,A54,A55].

changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,_,A52,A53,A54,A55],5,1,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,Y,A52,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,_,A53,A54,A55],5,2,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,Y,A53,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,_,A54,A55],5,3,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,Y,A54,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,_,A55],5,4,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,Y,A55].
changeList([A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,_],5,5,Y,NX)
:-NX=[A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,Y].

/*
* To change the Ith value in the list with Y and bind it to NX
*/
changeOneDList([_,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],1,Y,NX):-
NX=[Y,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,_,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],2,Y,NX):-
NX=[A1,Y,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,_,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],3,Y,NX):-
NX=[A1,A2,Y,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,_,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],4,Y,NX):-
NX=[A1,A2,A3,Y,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,_,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],5,Y,NX):-
NX=[A1,A2,A3,A4,Y,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,_,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],6,Y,NX):-
NX=[A1,A2,A3,A4,A5,Y,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,_,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],7,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,Y,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,_,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],8,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,Y,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,_,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],9,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,Y,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,_,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],10,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,Y,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,_,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],11,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,Y,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,_,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],12,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,Y,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,_,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],13,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,Y,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,_,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],14,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,Y,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,_,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25],15,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,Y,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,_,A17,A18,A19,A20,A21,A22,A23,A24,A25],16,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,Y,A17,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,_,A18,A19,A20,A21,A22,A23,A24,A25],17,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,Y,A18,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,_,A19,A20,A21,A22,A23,A24,A25],18,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,Y,A19,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,_,A20,A21,A22,A23,A24,A25],19,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,Y,A20,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,_,A21,A22,A23,A24,A25],20,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,Y,A21,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,_,A22,A23,A24,A25],21,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,Y,A22,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,_,A23,A24,A25],22,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,Y,A23,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,_,A24,A25],23,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,Y,A24,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,_,A25],24,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,Y,A25].
changeOneDList([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,_],25,Y,NX):-
NX=[A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,Y].


/*
* To help play, by doing different things based on the input. X is the Board, the second argument
* is the player whose turn it is, and the third argument is the move number in the game
*/
/*
* If it is the player 1's turn, all moves haven't taken place, player 2 hasn't won yet, then display
* the board, accept input, modify the board, and call play help with the modified board, player 2's turn,
* and move number increased by 1
*/
playHelp(X,1,MoveNumber):-MoveNumber<26,\+checkWin(X,2),bdisplay(X,1),addInputUser(X,1,NX),NextMove is MoveNumber+1,playHelp(NX,2,NextMove).
/*
* If it is player 1's turn, all moves haven't taken place, player 2 has won, then display the
* board and declare player 2 to be the winner
*/
playHelp(X,1,MoveNumber):-MoveNumber<26,checkWin(X,2),bdisplay(X,1),giveResult(2),!.
/*
* If it is the player 2's turn, all moves haven't taken place, it is not player 2's first move,
* player 1 hasn't won yet, then display the board, get the program's input, modify the board,
* and call play help with the modified board, player 1's turn, and move number increased by 1
*/
playHelp(X,2,MoveNumber):-MoveNumber>2,MoveNumber<26,\+checkWin(X,1),bdisplay(X,1),computerPlay(X,NX),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).
/*
* If it is player 2's turn, all moves haven't taken place, player 1 has won, then display the
* board and declare player 1 to be the winner
*/
playHelp(X,2,MoveNumber):-MoveNumber>2,MoveNumber<26,checkWin(X,1),bdisplay(X,1),giveResult(1),!.
/*
* If it is player 2's turn, the computer's turn, it is its first move, the center cell is empty,
* then play in the center cell
*/
playHelp(X,2,MoveNumber):-MoveNumber=:=2,nth0(13,X,Value),Value=:=0,changeOneDList(X,13
,2,NX),bdisplay(X,1),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).
/*
* If it is player 2's turn, the computer's turn, it is its first move, the center cell is not empty,
* then play in the first cell
*/
playHelp(X,2,MoveNumber):-MoveNumber=:=2,nth0(1,X,Value),Value=:=0,changeOneDList(X,1,2,NX),bdisplay(X,1),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).
/*
* If the board is full, and player 1 has won, then declare it to be the winner
*/
playHelp(X,_,26):-checkWin(X,1),giveResult(1),!.
/*
* If the board is full, and player 1 has not won, then it must be a draw, so declare a draw
*/
playHelp(X,_,26):- \+checkWin(X,1),giveResult(0),!.

/*
* List of all victory conditions in Tic-Tac-Toe
*/
checkWin([A11,A12,A13,A14,A15,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],I):-A11=I,A11=A12,A12=A13,A13=A14,A14=A15.
checkWin([_,_,_,_,_,A21,A22,A23,A24,A25,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],I):-A21=I,A21=A22,A22=A23,A23=A24,A24=A25.
checkWin([_,_,_,_,_,_,_,_,_,_,A31,A32,A33,A34,A35,_,_,_,_,_,_,_,_,_,_],I):-A31=I,A31=A32,A32=A33,A33=A34,A34=A35.
checkWin([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,A41,A42,A43,A44,A45,_,_,_,_,_],I):-A41=I,A41=A42,A42=A43,A43=A44,A44=A45.
checkWin([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,A51,A52,A53,A54,A55],I):-A51=I,A51=A52,A52=A53,A53=A54,A54=A55.

checkWin([A11,_,_,_,_,A21,_,_,_,_,A31,_,_,_,_,A41,_,_,_,_,A51,_,_,_,_],I):-A11=I,A11=A21,A21=A31,A31=A41,A41=A51.
checkWin([_,A12,_,_,_,_,A22,_,_,_,_,A32,_,_,_,_,A42,_,_,_,_,A52,_,_,_],I):-A12=I,A12=A22,A22=A32,A32=A42,A42=A52.
checkWin([_,_,A13,_,_,_,_,A23,_,_,_,_,A33,_,_,_,_,A43,_,_,_,_,A53,_,_],I):-A13=I,A13=A23,A23=A33,A33=A43,A43=A53.
checkWin([_,_,_,A14,_,_,_,_,A24,_,_,_,_,A34,_,_,_,_,A44,_,_,_,_,A54,_],I):-A14=I,A14=A24,A24=A34,A34=A44,A44=A54.
checkWin([_,_,_,_,A15,_,_,_,_,A25,_,_,_,_,A35,_,_,_,_,A45,_,_,_,_,A55],I):-A15=I,A15=A25,A25=A35,A35=A45,A45=A55.

checkWin([A11,_,_,_,_,_,A22,_,_,_,_,_,A33,_,_,_,_,_,A44,_,_,_,_,_,A55],I):-A11=I,A11=A22,A22=A33,A33=A44,A44=A55.
checkWin([_,_,_,_,A15,_,_,_,A24,_,_,_,A33,_,_,_,A42,_,_,_,A51,_,_,_,_],I):-A15=I,A15=A24,A24=A33,A33=A42,A42=A51.


/*
* To display the result based on who wins
*/
giveResult(0):-write('Draw!\n').
giveResult(1):-write('You win!\n').
giveResult(2):-write('I win!\n').

/*
* For taking the board X, and modifying it with the computer's move and binding it to NX
*/
computerPlay(X,NX):-findBestMove(X,NewPos),changeOneDList(X,NewPos,2,NX).

/*
* To check if any moves are left in the game
*/
/*
* Call the isMovesHelper, with 1 to aid recursion
*/
isMovesLeft(X):- \+isMovesLeftHelper(X,1).
/*
* If I<10, i.e., recursion is to continue, then check if the Ith position is non-zero, and
* recurse with I+1
*/
isMovesLeftHelper(X,I):-I<10,nth0(I,X,Value),Value=\=0,NextI is I+1,isMovesLeftHelper(X,NextI).
/*
* If I is 10, then stop recursing
*/
isMovesLeftHelper(_,I):-I=:=10.

/*
* To evaluate the score, based on the state of the board
*/
% If player 2 has won, then the score is 10
evaluate(X,Score):-checkWin(X,2),Score is 10.
% If player 1 has won, then the score is -10
evaluate(X,Score):-checkWin(X,1),Score is (-10).
% If no one has one, then the score is 0
evaluate(X,Score):- \+checkWin(X,1),\+checkWin(X,2),Score is 0.

/*
* For finding the minimax value
*/
/*
* If the score is 10, i.e., player 2 is winning, then result is the score
*/
minimax(X,Depth,_,Result):-evaluate(X,Score),Score=:=10,Result=Score-Depth,!.
/*
* If the score is -10, i.e., player 1 is winning, then result is the score
*/
minimax(X,Depth,_,Result):-evaluate(X,Score),Score=:=(-10),Result=Score+Depth,!.
/*
* If no moves are left, then result is 0
*/
minimax(X,_,_,Result):- \+isMovesLeft(X),Result=0,!.
/*
* If player 2's turn is being simulated, then find the best move for player 2 from this stage
*/
minimax(X,Depth,IsMax,Result):-isMovesLeft(X),IsMax = 1,Best is (-1000),
NewDepth is Depth+1,
(
((nth0(1,X,Value1),Value1=:=0,changeOneDList(X,1,2,NX1),minimax(NX1,NewDepth,0,Result1));Result1 is Best),
((nth0(2,X,Value2),Value2=:=0,changeOneDList(X,2,2,NX2),minimax(NX2,NewDepth,0,Result2));Result2 is Best),
((nth0(3,X,Value3),Value3=:=0,changeOneDList(X,3,2,NX3),minimax(NX3,NewDepth,0,Result3));Result3 is Best),
((nth0(4,X,Value4),Value4=:=0,changeOneDList(X,4,2,NX4),minimax(NX4,NewDepth,0,Result4));Result4 is Best),
((nth0(5,X,Value5),Value5=:=0,changeOneDList(X,5,2,NX5),minimax(NX5,NewDepth,0,Result5));Result5 is Best),
((nth0(6,X,Value6),Value6=:=0,changeOneDList(X,6,2,NX6),minimax(NX6,NewDepth,0,Result6));Result6 is Best),
((nth0(7,X,Value7),Value7=:=0,changeOneDList(X,7,2,NX7),minimax(NX7,NewDepth,0,Result7));Result7 is Best),
((nth0(8,X,Value8),Value8=:=0,changeOneDList(X,8,2,NX8),minimax(NX8,NewDepth,0,Result8));Result8 is Best),
((nth0(9,X,Value9),Value9=:=0,changeOneDList(X,9,2,NX9),minimax(NX9,NewDepth,0,Result9));Result9 is Best),
((nth0(10,X,Value10),Value10=:=0,changeOneDList(X,10,2,NX10),minimax(NX10,NewDepth,0,Result10));Result10 is Best),
((nth0(11,X,Value11),Value11=:=0,changeOneDList(X,11,2,NX11),minimax(NX11,NewDepth,0,Result11));Result11 is Best),
((nth0(12,X,Value12),Value12=:=0,changeOneDList(X,12,2,NX12),minimax(NX12,NewDepth,0,Result12));Result12 is Best),
((nth0(13,X,Value13),Value13=:=0,changeOneDList(X,13,2,NX13),minimax(NX13,NewDepth,0,Result13));Result13 is Best),
((nth0(14,X,Value14),Value14=:=0,changeOneDList(X,14,2,NX14),minimax(NX14,NewDepth,0,Result14));Result14 is Best),
((nth0(15,X,Value15),Value15=:=0,changeOneDList(X,15,2,NX15),minimax(NX15,NewDepth,0,Result15));Result15 is Best),
((nth0(16,X,Value16),Value16=:=0,changeOneDList(X,16,2,NX16),minimax(NX16,NewDepth,0,Result16));Result16 is Best),
((nth0(17,X,Value17),Value17=:=0,changeOneDList(X,17,2,NX17),minimax(NX17,NewDepth,0,Result17));Result17 is Best),
((nth0(18,X,Value18),Value18=:=0,changeOneDList(X,18,2,NX18),minimax(NX18,NewDepth,0,Result18));Result18 is Best),
((nth0(19,X,Value19),Value19=:=0,changeOneDList(X,19,2,NX19),minimax(NX19,NewDepth,0,Result19));Result19 is Best),
((nth0(20,X,Value20),Value20=:=0,changeOneDList(X,20,2,NX20),minimax(NX20,NewDepth,0,Result20));Result20 is Best),
((nth0(21,X,Value21),Value21=:=0,changeOneDList(X,21,2,NX21),minimax(NX21,NewDepth,0,Result21));Result21 is Best),
((nth0(22,X,Value22),Value22=:=0,changeOneDList(X,22,2,NX22),minimax(NX22,NewDepth,0,Result22));Result22 is Best),
((nth0(23,X,Value23),Value23=:=0,changeOneDList(X,23,2,NX23),minimax(NX23,NewDepth,0,Result23));Result23 is Best),
((nth0(24,X,Value24),Value24=:=0,changeOneDList(X,24,2,NX24),minimax(NX24,NewDepth,0,Result24));Result24 is Best),
((nth0(25,X,Value25),Value25=:=0,changeOneDList(X,25,2,NX25),minimax(NX25,NewDepth,0,Result25));Result25 is (-1000))),
FindMaxFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9,Result10,Result11,Result12,Result13,Result14,Result15,Result16,Result17,Result18,Result19,Result20,Result21,Result22,Result23,Result24,Result25],
max_list(FindMaxFrom,Result).

/*
* If player 1's turn is being simulated, then find the best move for player 1 from this stage
*/
minimax(X,Depth,IsMax,Result):-isMovesLeft(X),IsMax = 0,Best is 1000,
NewDepth is Depth+1,
(
((nth0(1,X,Value1),Value1=:=0,changeOneDList(X,1,1,NX1),minimax(NX1,NewDepth,1,Result1));Result1 is Best),
((nth0(2,X,Value2),Value2=:=0,changeOneDList(X,2,1,NX2),minimax(NX2,NewDepth,1,Result2));Result2 is Best),
((nth0(3,X,Value3),Value3=:=0,changeOneDList(X,3,1,NX3),minimax(NX3,NewDepth,1,Result3));Result3 is Best),
((nth0(4,X,Value4),Value4=:=0,changeOneDList(X,4,1,NX4),minimax(NX4,NewDepth,1,Result4));Result4 is Best),
((nth0(5,X,Value5),Value5=:=0,changeOneDList(X,5,1,NX5),minimax(NX5,NewDepth,1,Result5));Result5 is Best),
((nth0(6,X,Value6),Value6=:=0,changeOneDList(X,6,1,NX6),minimax(NX6,NewDepth,1,Result6));Result6 is Best),
((nth0(7,X,Value7),Value7=:=0,changeOneDList(X,7,1,NX7),minimax(NX7,NewDepth,1,Result7));Result7 is Best),
((nth0(8,X,Value8),Value8=:=0,changeOneDList(X,8,1,NX8),minimax(NX8,NewDepth,1,Result8));Result8 is Best),
((nth0(9,X,Value9),Value9=:=0,changeOneDList(X,9,1,NX9),minimax(NX9,NewDepth,1,Result9));Result9 is Best)),
((nth0(10,X,Value10),Value10=:=0,changeOneDList(X,10,1,NX10),minimax(NX10,NewDepth,1,Result10));Result10 is Best),
((nth0(11,X,Value11),Value11=:=0,changeOneDList(X,11,1,NX11),minimax(NX11,NewDepth,1,Result11));Result11 is Best),
((nth0(12,X,Value12),Value12=:=0,changeOneDList(X,12,1,NX12),minimax(NX12,NewDepth,1,Result12));Result12 is Best),
((nth0(13,X,Value13),Value13=:=0,changeOneDList(X,13,1,NX13),minimax(NX13,NewDepth,1,Result13));Result13 is Best),
((nth0(14,X,Value14),Value14=:=0,changeOneDList(X,14,1,NX14),minimax(NX14,NewDepth,1,Result14));Result14 is Best),
((nth0(15,X,Value15),Value15=:=0,changeOneDList(X,15,1,NX15),minimax(NX15,NewDepth,1,Result15));Result15 is Best),
((nth0(16,X,Value16),Value16=:=0,changeOneDList(X,16,1,NX16),minimax(NX16,NewDepth,1,Result16));Result16 is Best),
((nth0(17,X,Value17),Value17=:=0,changeOneDList(X,17,1,NX17),minimax(NX17,NewDepth,1,Result17));Result17 is Best),
((nth0(18,X,Value18),Value18=:=0,changeOneDList(X,18,1,NX18),minimax(NX18,NewDepth,1,Result18));Result18 is Best),
((nth0(19,X,Value19),Value19=:=0,changeOneDList(X,19,1,NX19),minimax(NX19,NewDepth,1,Result19));Result19 is Best),
((nth0(20,X,Value20),Value20=:=0,changeOneDList(X,20,1,NX20),minimax(NX20,NewDepth,1,Result20));Result20 is Best),
((nth0(21,X,Value21),Value21=:=0,changeOneDList(X,21,1,NX21),minimax(NX21,NewDepth,1,Result21));Result21 is Best),
((nth0(22,X,Value22),Value22=:=0,changeOneDList(X,22,1,NX22),minimax(NX22,NewDepth,1,Result22));Result22 is Best),
((nth0(23,X,Value23),Value23=:=0,changeOneDList(X,23,1,NX23),minimax(NX23,NewDepth,1,Result23));Result23 is Best),
((nth0(24,X,Value24),Value24=:=0,changeOneDList(X,24,1,NX24),minimax(NX24,NewDepth,1,Result24));Result24 is Best),
((nth0(25,X,Value25),Value25=:=0,changeOneDList(X,25,1,NX25),minimax(NX25,NewDepth,1,Result25));Result25 is Best),
FindMinFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9,Result10,Result11,Result12,Result13,Result14,Result15,Result16,Result17,Result18,Result19,Result20,Result21,Result22,Result23,Result24,Result25],
min_list(FindMinFrom,Result).

/*
* Find the best move to be played at this point
*/
findBestMove(X,NewPos):-Best is (-1000),
(
((nth0(1,X,Value1),Value1=:=0,changeOneDList(X,1,2,NX1),minimax(NX1,0,0,Result1));Result1 is Best),
((nth0(2,X,Value2),Value2=:=0,changeOneDList(X,2,2,NX2),minimax(NX2,0,0,Result2));Result2 is Best),
((nth0(3,X,Value3),Value3=:=0,changeOneDList(X,3,2,NX3),minimax(NX3,0,0,Result3));Result3 is Best),
((nth0(4,X,Value4),Value4=:=0,changeOneDList(X,4,2,NX4),minimax(NX4,0,0,Result4));Result4 is Best),
((nth0(5,X,Value5),Value5=:=0,changeOneDList(X,5,2,NX5),minimax(NX5,0,0,Result5));Result5 is Best),
((nth0(6,X,Value6),Value6=:=0,changeOneDList(X,6,2,NX6),minimax(NX6,0,0,Result6));Result6 is Best),
((nth0(7,X,Value7),Value7=:=0,changeOneDList(X,7,2,NX7),minimax(NX7,0,0,Result7));Result7 is Best),
((nth0(8,X,Value8),Value8=:=0,changeOneDList(X,8,2,NX8),minimax(NX8,0,0,Result8));Result8 is Best),
((nth0(9,X,Value9),Value9=:=0,changeOneDList(X,9,2,NX9),minimax(NX9,0,0,Result9));Result9 is Best),
((nth0(10,X,Value10),Value10=:=0,changeOneDList(X,10,2,NX10),minimax(NX10,0,0,Result10));Result10 is Best),
((nth0(11,X,Value11),Value11=:=0,changeOneDList(X,11,2,NX11),minimax(NX11,0,0,Result11));Result11 is Best),
((nth0(12,X,Value12),Value12=:=0,changeOneDList(X,12,2,NX12),minimax(NX12,0,0,Result12));Result12 is Best),
((nth0(13,X,Value13),Value13=:=0,changeOneDList(X,13,2,NX13),minimax(NX13,0,0,Result13));Result13 is Best),
((nth0(14,X,Value14),Value14=:=0,changeOneDList(X,14,2,NX14),minimax(NX14,0,0,Result14));Result14 is Best),
((nth0(15,X,Value15),Value15=:=0,changeOneDList(X,15,2,NX15),minimax(NX15,0,0,Result15));Result15 is Best),
((nth0(16,X,Value16),Value16=:=0,changeOneDList(X,16,2,NX16),minimax(NX16,0,0,Result16));Result16 is Best),
((nth0(17,X,Value17),Value17=:=0,changeOneDList(X,17,2,NX17),minimax(NX17,0,0,Result17));Result17 is Best),
((nth0(18,X,Value18),Value18=:=0,changeOneDList(X,18,2,NX18),minimax(NX18,0,0,Result18));Result18 is Best),
((nth0(19,X,Value19),Value19=:=0,changeOneDList(X,19,2,NX19),minimax(NX19,0,0,Result19));Result19 is Best),
((nth0(20,X,Value20),Value20=:=0,changeOneDList(X,20,2,NX20),minimax(NX20,0,0,Result20));Result20 is Best),
((nth0(21,X,Value21),Value21=:=0,changeOneDList(X,21,2,NX21),minimax(NX21,0,0,Result21));Result21 is Best),
((nth0(22,X,Value22),Value22=:=0,changeOneDList(X,22,2,NX22),minimax(NX22,0,0,Result22));Result22 is Best),
((nth0(23,X,Value23),Value23=:=0,changeOneDList(X,23,2,NX23),minimax(NX23,0,0,Result23));Result23 is Best),
((nth0(24,X,Value24),Value24=:=0,changeOneDList(X,24,2,NX24),minimax(NX24,0,0,Result24));Result24 is Best),
((nth0(25,X,Value25),Value25=:=0,changeOneDList(X,25,2,NX25),minimax(NX25,0,0,Result25));Result25 is Best)),
FindMaxFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9,Result10,Result11,Result12,Result13,Result14,Result15,Result16,Result17,Result18,Result19,Result20,Result21,Result22,Result23,Result24,Result25],
max_list(FindMaxFrom,Value),
nth0(NewPos,FindMaxFrom,Value).
