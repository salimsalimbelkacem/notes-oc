#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Problème d’Optimisation Combinatoires Classiques]
)
= Modelisation:
== definitions des variables
$x_i$: variable de decision (binaire ou numerique)

$c_i$: cout (minimisation) ou profit (maximisation)
== fonction objective et contraintes
$
cases(
 M a x Z = sum_(i)^n x_i, "ou bien", M i n Z = sum_(i)^n x_i,,
x_i "entiers positifs"
)
$
= Probleme sac a dos 
== classique 
$
cases(
M a x Z = sum_(i=1)^n c_i x_i,,
sum_(i=1)^n a_i x_i <= b,
x_i in {0,1}
)
$ 

$c_i$: valeur/profit de l'objet $i$

$x_i$: variable de decision binaire
$cases( "1 objet" i "est choisi", "0 sinon")$

$a_i$: cout de l'objet $i$

$b$: capacité maximale du cout

== fractionaire

$
cases(
M a x Z = sum_(i=1)^n c_i x_i,,
sum_(i=1)^n a_i x_i <= b,
x_i "entiers positifs"
)
$ 
== Multi-diemensionnel

$
cases(
M a x Z = sum_(i=1)^n c_i x_i,,
sum_(i=1)^n a_i x_i <= b,
sum_(i=1)^n "dim"_i x_i <= d,
x_i in {0,1}
)
$ 

$"dim"_i$: valeur de la dimension suplementaire

$d$: capacité maximale de la dimesion suplementaire

== multi-knapsack
$
cases(
M a x Z = sum_(i=1)^(2n) c_(i mod (n+1)) x_i,,
sum_(i=1)^n a_i x_i <= b_1,
sum_(i=n+1)^(2n) a_i x_i <= b_2,
sum_(i=1)^n "dim"_i x_i <= d_1,
sum_(i=n+1)^(2n) "dim"_i x_i <= d_2,
x_i in {0, 1}
)
$ 

$b_1$, $b_2$: capacité maximal du cout du sac a dos 1 et 2

$d_1$, $d_2$: capacité maximal de la dimesion suplementaire du sac a dos 1 et 2


= Probleme TSP
$
cases(
 &M i n Z = sum_(i=1)^n sum_(j=1, i!=j)^n c_(i j) x_(i j),,
 &sum_(i=1, j!=i)^n x_(i j) = 1 &j=1\,...\,n,
 &sum_(j=1, j!=i)^n x_(i j) = 1 &i=1\,...\,n,
 &sum_(i in Q) sum_(j in Q, i!=j) x_(i j)>=1 & forall Q,
 &x_(i j) in {0,1} & i\,j = 1\,...\,n
)
$

$x_(i j)$ variable de decision binaire
$cases(1 "le chemin entre", "point" i "et point" j "est pris",,
0 "sinon") $

$c_(i j)$: cout de distance entre point $i$ et point $j$

= Probleme FLP
== UFLP (stock et demande a quantite infinie)
$
cases(
  &M i n Z = sum_(j in J) f_i x_j + sum_(i in I) sum_(j in J) c_(i j) y_(i j),,
  &sum_(j in J)y_(i j) = 1 & forall i in I,
  &y_(i j) <= x_(i) & forall i in I\, forall j in J,
  &x_j in {0,1} &forall j in J,
  &y_(i j) in {0,1} &forall i in I\, forall j in J
)
$

$x_j$: variable de decision binaire
$cases(1 "site" j "ouvre",
0 "sinon") $

\

$y_(i j)$: variable de decision binaire
$cases(1 "client" i "est","   satisfait par site" j,,
0 "sinon") $

$i in I$: ensemble des clients

$j in J$: ensemble des sites

$c_(i j)$: cout du site $j$ au client $i$

== CFLP (stock et demande a quantite limite)
$
cases(
  &M i n Z = sum_(j in J) f_i x_j + sum_(i in I) sum_(j in J) c_(i j) y_(i j),,
  &sum_(j in J)y_(i j) = d_i & forall i in I,
  &sum_(i in I)y_(i j) <= q_j x_j & forall i in I\, forall j in J,
  &x_j in {0,1} &forall j in J,
  &y_(i j) >=0 &forall i in I\, forall j in J
)
$

$d_i$: demande du client $i$

$q_j$: stock disponible du site $j$

= Probleme de couverture
== couverture
$
cases(
M i n Z = sum_(j) C_j x_j,,
sum_(j) A_(i j)x_j >= 1 & forall i in I,
x_j in {0,1}^n
)
$
$x_j$: variable de decision binaire
$cases(1 "projet" j "est choisie", "0 sinon")$

$C_j$: cout du projet $j$

$A_(i j)$ variable de decision binaire
$cases(1 "projet" j "couvre zone" i, "0 sinon")$

== partitionnement
$
cases(
M i n Z = sum_(j) C_j x_j,,
sum_(j) A_(i j)x_j = 1 & forall i in I,
x_j in {0,1}^n
)
$

== embalage
$
cases(
M i n Z = sum_(j) C_j x_j,,
sum_(j) A_(i j)x_j <= 1 & forall i in I,
x_j in {0,1}^n
)
$

= Probleme de decoupage
