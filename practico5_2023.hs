--Ejercicio 1
listaInf :: [Int]
listaInf = 1 : listaInf

--Ejercicio 2
listaInfNat :: Integer -> [Integer]
listaInfNat n = n : listaInfNat (n+1)

--Ejercicio 3
primerosNat :: Integer -> [Integer]
primerosNat 0 = [] 
primerosNat n = [1..n]

--Ejercicio 4
primerosListaInf :: [Int]
primerosListaInf = take 5 [1..] 

--Ejercicio 5
cuadrados :: [Integer] -> [Integer]
cuadrados (xs) = map (^2) (xs)

--Ejercicio 6
divisores :: Int -> Int -> Bool
divisores x y = (mod x y) == 0

listaDivisores :: Int -> [Int]
listaDivisores n = filter (divisores n) [1..n]

--Ejercicio 7
factores:: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]

primo :: Int -> Bool
primo n = if factores n == [1,n] then True else False

listaPrimos :: [Int] -> [Int]
listaPrimos (xs) = filter (primo) (xs)

--Ejercicio 8
sumaCuadrado :: [Int] -> Int
sumaCuadrado xs = sum (map (^2) xs)

--Ejercicio 9
listaSuc :: [Int] -> [Int]
listaSuc (xs) = map (+1) (xs)

--Ejercicio 10
suma :: [Int] -> Int
suma (xs) = foldr (+) 0 xs

--Ejercicio 11
producto :: Int -> Int
producto n = foldr (*) 1 [1..n]

--Ejercicio 12
and1 :: [Bool] -> Bool
and1 (xs) = foldr (&&) (True) (xs)

--Ejercicio 13
contar :: a -> Int -> Int
contar _ a = a + 1

tam1 :: [a] -> Int
tam1 (xs) = foldr (contar) 0 xs 

--Ejercicio 14
sucesor :: [Int] -> [Int]
sucesor (xs) = [x+1 | x <- xs]

--Ejercicio 15
cuadrado :: [Int] -> [Int]
cuadrado (xs) = [x^2 | x <- xs]

--Ejercicio 16
paresMayor :: [Int] -> [Int]
paresMayor (xs) = [x | x <- xs, mod x 2 == 0, x > 10]

--Ejercicio 17
divisores1 :: Int -> [Int]
divisores1 n = [x | x <- [1..n], mod n x == 0]

--Ejercicio 18
todosOcurrenEn :: (Eq a) => [a] -> [a] -> Bool
todosOcurrenEn (xs) (ys) = length [x | x <- xs, x `elem` ys] == length xs

--Ejercicio 19
entreN :: Int -> [Int]
entreN n = [x | x <- [2..n], primo x]

--Ejercicio 20
cartesiano :: [Int] -> [Int] -> [(Int, Int)]
cartesiano (xs) (ys) = [(x,y) | x <- xs, y <- ys]

--Ejercicio 21
repeticiones :: Int -> [Int] -> Int
repeticiones n (xs) = length [x | x <- xs, x == n]

--Ejercicio 22
split2 :: [a] -> [([a],[a])]
split2  (xs) = [(take n xs,drop n xs) | n <- [0..length xs]]

--Ejercicio 23
sumaSeg :: [Int] -> Int
sumaSeg (xs) = sum [sum (take n xs) | n <- [0..length xs]]

--Ejercicio 24
listaInfPar :: [Int]
listaInfPar = [x | x <- [2,4..]]


subsequences :: [a] -> [[a]]
subsequences [] = [[]]
subsequences (x:xs) = subsequences xs ++ map (x:) (subsequences xs)

sumSub :: [Int] -> Int
sumSub [] = 0
sumSub (xs) = sum [sum x | x <- subsequences xs]

sumaSegm :: [Int] -> [Int]
sumaSegm (xs) = [sum (take n xs) | n <- [0..length xs]]