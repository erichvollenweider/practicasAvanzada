--Ejercicio 3
listaElemEq :: [Int] -> Bool 
listaElemEq (x:xs) = and [x == xs !! i | i <- [1..length xs-1]]


f :: [Int] -> Bool
f [] = True
f (x:xs) = g x xs

g :: Int -> [Int] -> Bool
g _ [] = True
g n (x:xs) = n == x && g n xs

--Ejercicio 4
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs

--Ejercicio 5
ordCreciente :: [Int] -> Bool
ordCreciente [] = True
ordCreciente [x] = True
ordCreciente (x:y:xs) = x <= y && ordCreciente (y:xs)

--Ejercicio 6
myMin :: [Int] -> Int
myMin [] = maxBound :: Int
myMin (x:xs) = x `min` (myMin xs)

--Ejercicio 7
sumaIgual :: [Int] -> Bool
sumaIgual [] = False
sumaIgual (x:xs) = x == sum xs || h x xs

h :: Int -> [Int] -> Bool
h _ [] = False
h n (x:xs) = x == n + sum xs || h (n+x) xs

--Ejercicio 9
p :: [Int] -> [Int] -> Bool
p [] ys = True
p (x:xs) [] = False
p (x:xs) (y:ys) = y == x && (q xs ys) || (p (x:xs) ys)

q :: [Int] -> [Int] -> Bool
q [] ys = True
q (x:xs) [] = False
q (x:xs) (y:ys) = y == x && (q xs ys)

--Ejercicio 10
prom :: (Num a) => [a] -> (a, a)
prom [x] = (x, 1)
prom (x:xs) = (x + a, 1 + b)
               where (a,b) = prom xs

promedio :: (Fractional a, Num a) => [a] -> a
promedio [x] = x
promedio (x:xs) = (fst (prom (x:xs))) / (snd (prom (x:xs)))

