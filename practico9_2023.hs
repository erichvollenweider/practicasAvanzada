--Ejercicio 1
-- a)
-- F:: [a] -> Bool
-- F.xs = < ParaTodo i: 0 <= i < #xs: xs.0 = xs.i >

eqElem :: (Eq a) => Int -> [a] -> Bool
eqElem i xs = all (== xs !! i) xs
--eqElem i xs = head xs == (xs !! i)

paraTodo :: (Eq a) => [Int] -> [a] -> (Int -> [a] -> Bool) -> Bool
paraTodo xs ys f = and [f x ys | x <- xs]

-- b)
-- F:: [a] -> Bool
-- F.xs = <ParaTodo i,j: 0 <= i < #xs ^ 0 <= j < #xs: i/=j && xs.i /= xs.j >

-- c)
-- F:: [a] -> Bool
-- F.xs = <ParaTodo i,j: 0 <= i < #xs ^ 0 <= j < #xs: i<=j ^ xs.i <= xs.j >

--------------------------------------------------------------------------------------------------------
--b)
subsec :: [Int] -> [Int] -> Bool
subsec xs ys = or [x == ys | x <- subsegmentos xs]

subsegmentos :: [a] -> [[a]]
subsegmentos xs = [as | i <- [0..length xs], j <- [i..length xs], let as = take (j - i) (drop i xs)]

--c)
subsecF :: [Int] -> [Int] -> Bool
subsecF xs ys = [x | x <- reverse (take (length ys) (reverse xs))] == ys

sinVacio :: [[Int]] -> [[Int]]
sinVacio [x] = [x]
sinVacio (x:xs) = if x == [] then sinVacio xs else x:sinVacio xs

subsecF' :: [Int] -> [Int] -> Bool
subsecF' xs ys = or [reverse x == ys | x <- take (length xs) (sinVacio (subsegmentos (reverse xs)))]

----------------------------------------------------------------------------------------------------------
--Ejercicio 5
--a)
divN :: Int -> Int
divN n = length [x | x <- [1..n], mod n x == 0]

prodPrim :: [Int] -> Int
prodPrim xs = product [xs !! i | i <- [0..length xs-1], divN (xs !! i) == 2]

split2 :: [Int] -> [([Int],[Int])]
split2 (xs) = [(take n xs, drop n xs) | n <- [0..length xs]]

split3 :: [Int] -> [([Int],[Int],[Int])]
split3 xs = [(as, bs, cs) | (as, ys) <- split2 xs, (bs, cs) <- split2 ys]

--b) subsegmento.xs.ys = < E as, cs :: xs = as ++ ys ++ cs >
--                              otra forma
--   subsegmento.xs.ys = < E as, bs, cs : xs = as ++ bs ++ cs : ys = bs >
subsegmento' :: [Int] -> [Int] -> Bool
subsegmento' xs ys = or [bs == ys | (as, bs, cs) <- split3 xs]

--c) subsegmentoF.xs.ys = < E as, bs cs : xs = as ++ bs ++ cs : ys = cs >
subsegmentoF' :: [Int] -> [Int] -> Bool
subsegmentoF' xs ys = or [cs == ys | (as, bs, cs) <- split3 xs]

subsegmentoI' :: [Int] -> [Int] -> Bool
subsegmentoI' xs ys = or [as == ys | (as, bs, cs) <- split3 xs]

--d) subSegSumMax.xs = <maximum as, bs, cs : xs = as ++ bs ++ cs : bs >
subSegSumMax :: [Int] -> Int
subSegSumMax xs = maximum [sum (bs) | (as, bs, cs) <- split3 xs]
