--import Prelude hiding (all)
--import Prelude hiding (any)
--import Prelude hiding (takeWhile)
--import Prelude hiding (dropWhile)
--import Prelude hiding (map)
--import Prelude hiding (filter)
import Prelude hiding (iterate)

--all :: (a -> Bool) -> [a] -> Bool

--all p xs = and (map p xs)

--all p xs = map p (and xs)

--all p = and . map p

--all p = not . any (not . p)

--all p = map p . and

--all p xs = foldl (&&) True (map p xs)

--all p xs = foldr (&&) False (map p xs)

--all p = foldr (&&) True . map p

--any :: (a -> Bool) -> [a] -> Bool

--any p = map p . or

--any p = or . map p

--any p xs = length (filter p xs) > 0

--any p = not . null . dropWhile (not . p)

--any p = null . filter p

--any p xs = not (all (\ x -> not (p x)) xs)

--any p xs = foldr (\ x acc -> (p x) || acc) False xs

--any p xs = foldl (||) True (map p xs)

--takeWhile :: (a -> Bool) -> [a] -> [a]

--takeWhile _ [] = []
--takeWhile p (x : xs)
--    | p x = x : takeWhile p xs
--	| otherwise = takeWhile p xs
	
--takeWhile _ [] = []
--takeWhile p (x : xs)
--    | p x = x : takeWhile p xs
--	| otherwise = []
	
--takeWhile _ [] = []
--takeWhile p (x : xs)
--    | p x = takeWhile p xs
--	| otherwise = []
	
--takeWhile p = foldl (\ acc x -> if p x then x : acc else acc) []

--dropWhile :: (a -> Bool) -> [a] -> [a]

--dropWhile _ [] = []
--dropWhile p (x : xs)
--    | p x = dropWhile p xs
--	| otherwise = x : xs
	
--dropWhile _ [] = []
--dropWhile p (x : xs)
--    | p x = dropWhile p xs
--	| otherwise = xs
	
--dropWhile p = foldr (\ x acc -> if p x then acc else x : acc) []

--dropWhile p = foldl add []
--    where add [] x = if p x then [] else [x]
--	      add acc x = x : acc

--map :: (a -> b) -> [a] -> [b]

--map f = foldr (\ x xs -> xs ++ [f x]) []

--map f = foldr (\ x xs -> f x ++ xs) []

--map f = foldl (\ xs x -> f x : xs) []

--map f = foldl (\ xs x -> xs ++ [f x]) []

--filter :: (a -> Bool) -> [a] -> [a]

--filter p = foldl (\ xs x -> if p x then x : xs else xs) []

--filter p = foldr (\ x xs -> if p x then x : xs else xs) []

--filter p = foldr (\ x xs -> if p x then xs ++ [x] else xs) []

--filter p = foldl (\ x xs -> if p x then xs ++ [x] else xs) []

dec2int :: [Integer] -> Integer

--dec2int = foldr (\ x y -> 10 * x + y) 0

--dec2int = foldl (\ x y -> x + 10 * y) 0

dec2int = foldl (\ x y -> 10 * x + y) 0

--dec2int = foldr (\ x y -> x + 10 * y) 0

--compose :: [a -> a] -> (a -> a)
--compose = foldr (.) id

--sumsqreven = compose [sum, map(^ 2), filter even]

unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
    | p x = []
	| otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
--chop8 [] = []
--chop8 bits = take 8 bits : chop8 (drop 8 bits)
chop8 = unfold null (take 8) (drop 8)

--map f = unfold null (f) tail

--map f = unfold null (f (head)) tail

--map f = unfold null (f . head) tail

--map f = unfold empty (f . head) tail

iterate :: (a -> a) -> a -> [a]

iterate f = unfold (const False) id f

--iterate f = unfold (const False) f f

--iterate f = unfold (const True) id f

--iterate f = unfold (const True) f f