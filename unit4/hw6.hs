--import Prelude hiding (all)
--import Prelude hiding (any)

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
