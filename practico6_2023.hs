--Ejercicio 1
data Nat = Cero | Suc Nat

--Instanciamos la clase Show
--instance Show Nat where
-- show Cero = "Cero"
-- show (Suc c) = "Suc " ++ show n

--Ejercicio 2
natToInt :: Nat -> Int
natToInt Cero = 0
natToInt (Suc n) = 1 + natToInt n

--instance Show Nat where
--    show n = show (natToInt n)

instance Eq Nat where
    n == m = (natToInt n) == (natToInt m)

instance Ord Nat where
    Cero <= _ = True
    (Suc n) <= Cero = False
    (Suc n) <= (Suc m) = n <= m 


--Ejercicio 3
intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat n = (Suc (intToNat (n-1)))

instance Show Nat where
    show Cero = "Cero"
    show (Suc n) = "Suc " ++ show n

--Ejercicio 4
sumaNat :: Nat -> Nat -> Nat
sumaNat Cero m = m
sumaNat n Cero = n
sumaNat n m = (intToNat ((natToInt n) + (natToInt m)))

multNat :: Nat -> Nat -> Nat
multNat Cero m = Cero
multNat n Cero = Cero
multNat n m = (intToNat ((natToInt n) * (natToInt m)))

--Ejercicio 5
data Tree a = Nil | Node (Tree a) a (Tree a)
 deriving Show

--Ejercicio 6
size :: Tree a -> Int
size Nil = 0
size (Node hi r hd) = 1 + size hi + size hd

--Ejercicio 7
height:: Tree a -> Int
height Nil = 0
height (Node hi _ hd) = 1 + max (height hi) (height hd)

sumT :: (Num a) => Tree a -> a
sumT Nil = 0
sumT (Node hi r hd) = sumT hi + r + sumT hd

map1 :: (Num a) => Tree a -> (a -> a) -> Tree a
map1 Nil f = Nil
map1 (Node hi r hd) f = Node (map1 hi f) (f r) (map1 hd f)

mostrarReversa :: Tree a -> Tree a
mostrarReversa Nil = Nil
mostrarReversa (Node hi r hd) = Node (mostrarReversa hd) r (mostrarReversa hi)

data Hojatree a = Hoja a | Nodo (Hojatree a) a (Hojatree a)

hojas :: Hojatree a -> Int
hojas (Hoja _) = 1
hojas (Nodo hi _ hd) = (hojas hi) + (hojas hd)

--parImpar :: [Int] -> Bool
--parImpar [] = False
--parImpar (x:xs) = 

data Lista a = Nill | Cons a (Lista a)

instance Show a => Show (Lista a) where
    show Nill = "[]"
    show (Cons x xs) = show x ++ ":" ++ show xs

instance Eq a => Eq (Lista a) where
    Nill == Nill = True
    (Cons x xs) == (Cons y ys) = x == y && xs == ys
    _ == _ = False

cabeza :: Lista a -> a
cabeza (Cons x _) = x

cola :: Lista a -> Lista a
cola (Cons x xs) = xs

concatenar :: Lista a -> Lista a -> Lista a
concatenar (Cons x xs) Nill = (Cons x xs)
concatenar Nill ys = ys
concatenar (Cons x xs) (Cons y ys) = Cons x (concatenar xs ys)