double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns



alast xs = drop (length xs - 1) xs

blast xs = head (drop (length xs - 1) xs)

clast xs = tail (reverse xs)

dlast xs = reverse (head xs)

elast xs = xs !! (length xs - 1)

flast xs = head (drop (length xs) xs)

glast xs = head (reverse xs)

hlast xs = reverse xs !! (length xs - 1)



ainit xs  = tail (reverse xs)

binit xs = reverse (head (reverse xs))

cinit xs = reverse (tail xs)

dinit xs = take (length xs) xs

einit xs = reverse (tail (reverse xs))

finit xs = take (length xs - 1) (tail xs)

ginit xs = drop (length xs - 1) xs

hinit xs = take (length xs - 1) xs



aproduct [] = 1
aproduct (x : xs) = x * aproduct xs

qsorta [] = []
qsorta (x : xs) = qsorta larger ++ [x] ++ qsorta smaller
	where smaller = [a | a <- xs, a <= x]
	      larger = [b | b <- xs, b > x]

qsortb [] = []
qsortb (x : xs) = reverse (qsortb smaller ++ [x] ++ qsortb larger)
	where smaller = [a | a <- xs, a <= x]
	      larger = [b | b <- xs, b > x]		 
		  
qsortd [] = []
qsortd (x : xs)
	= reverse (qsortd smaller) ++ [x] ++ reverse (qsortd larger)
    where smaller = [a | a <- xs, a <= x]
          larger = [b | b  <- xs, b > x]
		  
qsorte [] = []
qsorte (x : xs) = qsorte larger ++ [x] ++ qsorte smaller
	where larger = [a | a <- xs, a > x || a == x]
	      smaller = [b | b <- xs, b < x]
		  
qsortf [] = []
qsortf (x : xs) = qsortf larger ++ [ x] ++ qsortf smaller
	where smaller = [a | a <- xs, a < x]
	      larger = [b | b <- xs, b > x]
		  
qsortg [] = []
qsortg (x : xs)
	= reverse
		(reverse (qsortg smaller) ++ [x] ++ reverse (qsortg larger))
	where smaller = [a | a <- xs, a <= x]
	      larger = [b | b <- xs, b > x]