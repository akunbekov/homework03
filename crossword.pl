% Valid crossword words
word('Lisp', l, i, s, p).
word('Java', j, a, v, a).
word('ALGOL', a, l, g, o, l).
word('COBOL', c, o, b, o, l).
word('Pascal', p, a, s, c, a, l).
word('Prolog', p, r, o, l, o, g).
word('Clojure', c, l, o, j, u, r, e).
word('Fortran', f, o, r, t, r, a, n).
word('JavaScript', j, a, v, a, s, c, r, i, p, t).
word('Smalltalk', s, m, a, l, l, t, a, l, k).

% Step 1
%
% create a rule for fourLetterWord/1 here.  This means that it will be a rule
% that takes a single argument with the functor called 'fourLetterWord'.
% Remember that you can use '_' to unify with anything and not keep the
% instantiated value.

% This line will identify 4 character words
fourLetterWord(X) :- word(X, _, _, _, _).


% The following test is enabled and will fail until you have defined a valid
% fourLetterWord/1 rule
:- begin_tests(fourLetterWords).

test(fourLetterWord) :-
  setof(X, fourLetterWord(X), Xs),
  Xs == ['Java', 'Lisp'].

:- end_tests(fourLetterWords).


% Step 2
%
% Create a rule for endsWithOL/1 here.  This rule will check to see if a
% five-character word ends with the letters o and l.

endsWithOL(X) :- word(X, _, _, _, o, l).

:- begin_tests(endsWithOL).

test(endsWithOL) :-
  setof(X, endsWithOL(X), Xs),
  Xs = ['ALGOL', 'COBOL'].

:- end_tests(endsWithOL).


% Step 3
%
% Now, create crossword/10, a rule that will solve the crossword puzzle from the readme.

crossword(Across1, Across6, Across7, Across8, Across9, Down2, Down3, Down4, Down5, Down9) :- word(Across1, _, _, _, A),
	word(Across6, _, B, _, _, C), word(Across7, _, D, _, _, _, E), word(Across8, _, _, F, _, _),
	word(Across9, Y, _, _, G, _, _, H, _, _, I), word(Down2, A, _, _, E, _, F), word(Down3, _, B, _, _, _, G, _),
	word(Down4, _, C, _, _, _, H, _), word(Down5, _, _, D, _, _, I, _, _, _), word(Down9,Y, _, _, _).


:- begin_tests(crossword).

test(crossword) :-
  crossword('Lisp', 'COBOL', 'Pascal', 'ALGOL', 'JavaScript', 'Prolog', 'Fortran', 'Clojure', 'Smalltalk', 'Java').

:- end_tests(crossword).

% vim:set ft=prolog:







