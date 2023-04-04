--Ejercicio 1
merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge (x:xs) [] = xs
merge (x:xs) (y:ys)
 | (x <= y) = x:merge xs (y:ys)
 |otherwise = y:merge (x:xs) ys


--Ejercicio 2
delet :: (Eq a) => a -> [a] -> [a]
delet _ [] = []
delet n (x:xs)
 | n == x = xs
 | otherwise = x : delet n xs


ordlist :: (Ord a) => [a] -> [a]
ordlist [x] = [x]
ordlist (x:y) = minimum (x:y) : ordlist (delet (minimum (x:y))(x:y))

--Ejercicio 3
pot :: Int -> Int
pot 0 = 1
pot n = 2 * pot (n-1)

--Ejercicio 4
binario :: Int -> [Int]
binario 0 = [0]
binario 1 = [1]
binario n
 | mod n 2 == 0 = binario (div n 2) ++ [0]
 | otherwise = binario (div n 2) ++ [1]

--Ejercicio 5
espar :: Int -> Bool
espar n = if mod n 2 == 0 then True else False

--Ejercicio 6
ham :: (Eq a) => [a] -> [a] -> Int
ham [] [] = 0
ham xs [] = 0
ham [] ys = 0
ham (x:xs) (y:ys) = if x == y then 0 + ham xs ys else 1 + ham xs ys

--Ejercicio 7
cuadperf :: Integer -> Bool
cuadperf x = y^2 == x where y = round( sqrt (fromIntegral x))

--Ejercicio 8
repetir :: a -> Int -> [a]
repetir x 0 = []
repetir x 1 = [x]
repetir x n = x : repetir x (n-1)

repetido :: (Eq a) => [a] -> a -> Int -> Bool
repetido [] _ 0 = True
repetido [] _ n = False
repetido (x:xs) e n
 | x == e = repetido (xs) e (n-1)
 | otherwise = repetido (xs) e n


--Ejercicio 9
nelem :: [Int] -> Int -> Int
nelem [] _ = (-1)
nelem (x:xs) n = if n == 0 then x else nelem (xs) (n-1)

--Ejercicio 10
poselem :: (Eq a) => [a] -> a -> Int -> [Int]
poselem [] _ n = []
poselem (x:xs) e n 
 | x == e = (n):poselem xs e (n+1)
 | otherwise = poselem xs e (n+1)

--Ejercicio 11
compacto :: (Eq a) => [a] -> [a]
compacto [] = []
compacto [x] = [x]
compacto (x:xs:y)
 | x == xs = compacto (xs:y)
 | otherwise = x:compacto (xs:y)
