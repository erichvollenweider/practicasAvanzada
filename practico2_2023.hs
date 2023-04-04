--Ejercicio 1

--Ejercicio 2
--HEAD
hd :: [a] -> a
hd (x:xs) = x

--TAIL
tl :: [a] -> [a]
tl (x:xs) = xs

--LAST
lt :: [a] -> a
lt [x] = x
lt (x:xs) = lt xs

--INIT
nt :: [a] -> [a]
nt [x] = []
nt (x:xs) = x : nt xs

--Ejercicio 3
max3 :: Int -> Int -> Int -> Int
max3 x y z
 | x >= y && x >= z = x
 | y > x && y > z = y
 | otherwise = z 
 
--Ejercicio 4
--CONCATENAR
con :: [a] -> [a] -> [a]
con [] [] = []
con [] ys = ys
con xs [] = xs
con (x:xs) ys = x : con xs ys

--TOMAR
tomar :: Int -> [a] -> [a]
tomar 0 xs = []
tomar n [] = []
tomar n (x:xs) = x:(tomar (n-1) xs)

--TIRAR
tirar :: Int -> [a] -> [a]
tirar 0 xs = xs
tirar n [] = []
tirar n (x:xs) = tirar (n-1) xs

--CONCATENAR AL ULTIMO
conc :: a -> [a] -> [a]
conc x [] = [x]
conc x (xs) = xs ++ [x]

--Ejercicio 5
absoluto :: Int -> Int
absoluto x = if x >= 0 then x else -1 * x

--Ejercicio 6
edad :: (Int, Int, Int) -> (Int, Int, Int) -> Int
edad (d1, m1, a1) (d2, m2, a2)
 | d1 == d2 && m1 == m2 = (a2 - a1)
 | d1 >= d2 && m1 >= m2 = (a2 - a1 -1)
 | d1 < d2 && m1 >= m2 = (a2 - a1 -1)
 | otherwise = (a2 -a1)      

--Ejercicio 7
xor :: Bool -> Bool -> Bool
xor a b
 | a == True && b == True = False
 | a == True && b == False = True
 | a == False && b == True = True
 | a == False && b == False = False

xor2 :: Bool -> Bool -> Bool
xor2 a b = if a == b then False else True

--Ejercicio 8
factores:: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]

primo :: Int -> Bool
primo n = if factores n == [1,n] then True else False

--Ejercicio 9
listprimo:: Int -> [Int]
listprimo n = [x | x <- [2..n], primo x]

--Ejercicio 10
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

--Ejercicio 11
eqlist :: (Eq a) => [a] -> [a] -> Bool
eqlist x y = if x == y then True else False 

--Ejercicio 12
listpalin :: (Eq a) => [a] -> Bool
listpalin x = if x == reverse x then True else False

--Ejercicio 13
cuad :: Float -> Float
cuad n = n*n

raiz :: Float -> Float
raiz n = sqrt(n)

raizP :: Float -> Float -> Float -> Float
raizP a b c = (-b + raiz((cuad b) - (4 * a * c))) / (2 * a)

raizN :: Float -> Float -> Float -> Float
raizN a b c = (-b - raiz((cuad b) - (4 * a * c))) / (2 * a)

raizT :: Float -> Float -> Float -> [Float]
raizT a b c = [raizP a b c] ++ [raizN a b c]

cantRaiz :: Float -> Float -> Float -> Int
cantRaiz a b c
 | disc > 0 = 2
 | disc < 0 = 0
 | disc == 0 = 1
 where disc = (cuad b) - 4*a*c

