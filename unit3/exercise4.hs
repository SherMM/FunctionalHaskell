--import Prelude hiding ((^))
--import Prelude hiding (and)
--import Prelude hiding (concat)
--import Prelude hiding (replicate)
--import Prelude hiding ((!!))
--import Prelude hiding (elem) 

--m ^ 0 = 0 
--m ^ n = m * m ^ (n - 1)

--m ^ 0 = 1
--m ^ n = m *  m ^ (n - 1)

--m ^ 0 = 1
--m ^ n = m * m ^ n - 1

--m ^ 0 = 1
--m ^ n = n * n ^ (m - 1)

--m ^ 0 = 1
--m ^ n = m * (^) m (n - 1)

--m ^ 0 = 1
--m ^ n = m * m * m ^ (n - 2)

--m ^ 0 = 1
--m ^ n = (m * m) ^ (n - 1)

--m ^ 1 = m
--m ^ n = m * m ^  (n -1)


--and :: [Bool] -> Bool
--and [] = True
--and (b: bs) = b && and bs

--and [] = True
--and (b: bs)
--	| b = and bs
--	| otherwise = False


--and [] = True
--and (b : bs)
--	| b == False = False
--	| otherwise = and bs

--and [] = True
--and (b : bs) = b || and bs

--and [] = True
--and (b : bs) = and bs && b

--and [] = True
--and (b : bs)
--	| b = b
--	| otherwise = and bs

--concat :: [[a]] -> [a] 
--concat [] = []
--concat (xs : xss) = xs : concat xss

--concat [] = []
--concat (xs : xss) = xs ++ concat xss

--concat [] = [[]]
--concat (xs : xss) = xs ++ concat xss

--concat [[]] = []
--concat (xs : xss) = xs ++ concat xss


--replicate :: Int -> a -> [a]
--replicate 1 x = x
--replicate n x = x : replicate (n - 1) x

--replicate 0 _ = []
--replicate n x = replicate (n - 1) x : x

--replicate 0 _ = []
--replicate n x = x : replicate (n - 1) x

--(x : _) !! 0 = x
--(_ : xs) !! n = xs !! (n - 1)
--[] !! n = 0

--(x : _) !! 0 = x
--(_ : xs) !! n = xs !! (n - 1)

--elem :: Eq a => a -> [a] -> Bool

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
	= if x <= y then x : merge xs (y : ys) else y : merge (x : xs) ys
	
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
	where (ys, zs) = halve xs