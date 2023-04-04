--								Ejercicio 1

-- ghci> 2^29/2^9 == 2^20
-- True

--								Ejercicio 2

-- head(tail "hola mundo")

--								Ejercicio 3

-- head(reverse "hola mundo")

--								Ejercicio 4

-- :t reverse
-- reverse :: [a] -> [a]

-- :t head
-- head :: [a] -> a

-- :t tail
-- tail :: [a] -> [a]

--								Ejercicio 5

-- ghci> mod (sum[1,2,3]) 2 == 0
-- True

--								Ejercicio 6

-- ghci> mod (sum[1,2,3]) 3 == 0
-- True

--								Ejercicio 7

-- ghci> mod (sum[1,2,3]) 6 == 0
-- True

--								Ejercicio 8

reverdig :: Int -> [Int]
reverdig 0 = []
reverdig x = (reverdig (div x 10)) ++ [mod x 10]


--								Ejercicio 9

palindromo :: String -> Bool
palindromo x = if x == reverse(x) then True else False

--								Ejercicio 10

--ghci> (head.(drop 3)) "0123456"
--	'3'

--								Ejercicio 11



--								Ejercicio 12
