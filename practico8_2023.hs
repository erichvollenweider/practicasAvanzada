--Ejercicio 1
nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True

--Ejercicio 2
maj :: Bool -> Bool -> Bool -> Bool
maj True True _ = True
maj True _ True = True
maj _ True True = True
maj _ _ _ = False

--Ejercicios 3

-- Cuantificador existencial
existe :: (a -> Bool) -> [a] -> Bool
existe p xs = or [ p (xs !! i) | i <- [0..length xs - 1]]

existe' :: [Int] -> [a] -> (Int -> [a] -> Bool) -> Bool
existe' xs ys f = or [f x ys | x <- xs]

-- Cuantificador universal
paraTodo :: (a -> Bool) -> [a] -> Bool
paraTodo p xs = and [ p (xs !! i) | i <- [0..length xs - 1]]

paraTodo' :: [Int] -> [a] -> (Int -> [a] -> Bool) -> Bool
paraTodo' xs ys f = and [f x ys | x <- xs]

-- Ejemplo de uso
esPar' :: Int -> Bool
esPar' n = n `mod` 2 == 0

esEven :: Int -> [Int] -> Bool
esEven i xs = mod (xs !! i) 2 == 0

--Ejercicio 4
sumatoria :: (Num a) => (a -> a) -> [a] -> a
sumatoria f xs = sum [f (xs !! i) | i <- [0..length xs - 1]]

sumatoria' :: [Int] -> [a] -> (Int -> [a] -> Int) -> Int
sumatoria' xs ys f = sum [f x ys | x <- xs]

productoria :: (Num a) => (a -> a) -> [a] -> a
productoria f xs = product [f (xs !! i) | i <- [0..length xs - 1]]

productoria' :: [Int] -> [a] -> (Int -> [a] -> Int) -> Int
productoria' xs ys f = product [f x ys | x <- xs]

contatoria :: (Int -> Bool) -> [Int] -> Int
contatoria f xs = length [x | x <- xs, f x]

contatoria' :: [Int] -> [a] -> (Int -> [a] -> Bool) -> Int
contatoria' xs ys f = length [x | x <- xs, f x ys]

-- Ejemplo de uso
elevadoAlC :: (Int -> [Int] -> Int)
elevadoAlC i xs = (xs !! i)^2

elevadoAlI :: (Int -> [Int] -> Int)
elevadoAlI i xs = (xs !! i)^(length xs)

{-
Escribe una función en Haskell que reciba una lista de palabras y un número n,
y devuelva una lista con las palabras que tienen una longitud mayor a n.
-}

numLetras :: String -> Int
numLetras x = length x

palabrasN :: [String] -> Int -> (String -> Int) -> [String]
palabrasN (xs) n f = [x | x <- xs, f x > n]
-- O tambien
-- palabrasN xs n f = [xs !! i | i <- [0..length xs - 1], f (xs !! i) > n]

{-
Escribe una función en Haskell que reciba una lista de números y devuelva la suma de los números impares.
-}
listaImpar :: (Int -> Bool) -> [Int] -> [Int]
listaImpar f xs = [xs !! i | i <- [0..length xs -1], f (xs  !! i)]
--listaImpar f xs = [x | x <- xs, f x]

esImpar :: Int -> Bool
esImpar n
 | mod n 2 /= 0 = True
 |otherwise = False

{-
Escribe una función en Haskell que reciba una lista de números y devuelva la productoria de los números pares.
-}
producPares :: (Int -> Int) -> [Int] -> Int
producPares f xs = product (map f (filter esPar' xs))

{-
Escribe una función en Haskell que reciba una lista de palabras y devuelva 
la cantidad de palabras que comienzan con una letra específica.
-}

letraPalabra :: String -> Char
letraPalabra (x:xs) = x

listaDeP :: [String] -> Char -> (String -> Char) -> Int
listaDeP xs c f = length [f x | x <- xs, f x == c]
