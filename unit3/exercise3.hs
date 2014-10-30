import Data.Char

--sum100a = sum [[x * x ] | x <- [1 .. 100]]

sum100b = sum [x ^ 2 | x <- [1 .. 100]]

sum100c = sum [const 2 x | x <- [1 .. 100]]

sum100d = foldl (+) (1) [x ^ 2 | x <- [1 .. 100]]


replicate1 n a = [True | _ <- [1 .. n]]

replicate2 n a = [n | _ <- [1 .. n]]

replicate3 n a = [a | _ <- [1 .. a]]

replicate4 n a = [a | _ <- [1 .. n]]


find :: (Eq a) => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

positions :: (Eq a) => a -> [a] -> [Int]
positions x xs = find x (zip xs [0 .. n])
    where n = length xs - 1

--positions x xs = find x xs

--positions x xs = find x (zipWith (+) xs [0 .. n])
--    where n = length xs - 1

--positions x xs = find n (zip xs [0 .. x])
--    where n = length xs - 1


scalarproduct :: [Int] -> [Int] -> Int
--scalarproduct xs ys = sum [x * y | x <- xs, y <- ys]

scalarproduct xs ys = sum [x * y | (x,y) <- xs `zip` ys]

--scalarproduct xs ys = product (zipWith (+) xs ys)

--scalarproduct xs ys = sum (product [(x,y) | x <- xs, y <- ys])


let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c
    | isLower c = int2let ((let2int c + n) `mod` 26)
    | isUpper c = toUpper (int2let ((let2int (toLower c) + n) `mod` 26))
    | otherwise = c 

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

riffle :: [a] -> [a] -> [a]
--riffle xs ys = concat [[x,y] | x <- xs, y <- ys]

riffle xs ys = concat [[x,y] | (x,y) <- xs `zip` ys]

--riffle xs ys = [x, y | (x,y) <- xs `zip` ys]

--riffle xs ys = [x : [y] | x <- xs, y <- ys]


divides :: Int -> Int -> Bool
divides x y = y `mod` x == 0

divisors :: Int -> [Int]
divisors n = [x | x <- [1 .. n], x `divides` n]
