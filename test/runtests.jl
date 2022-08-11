using Test
using ColMinSum
m2 = [ 1 4 ; 
       2 3 ]
@test colminsum(m2) == [3 3; 3 7]
@test rowminsum(m2) == [5 4; 4 5]
m5 = [ 10 11 17 23  4 ;
       18 24  5  6 12 ;
	    1  7 13 19 25 ;
	   14 20 21  2  8 ;
	   22  3  9 15 16 ] .|> inv
@test colminsum(m5) == [sum(min.(m5[:, i], m5[:, j])) for i = 1:5, j = 1:5]
@test rowminsum(m5) == [sum(min.(m5[i, :], m5[j, :])) for i = 1:5, j = 1:5]
