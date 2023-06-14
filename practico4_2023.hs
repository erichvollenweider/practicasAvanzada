--Ejercicio 1
{-
        Orden Aplicativo
            2 * cuad (head [2,4,5,6,7,8])
            = {def head}
            = 2 * cuad (2)
            = {def cuadrado}
            = 2 * (2 * 2)
            = {aritmetica}
            = 2 * 4
            = {aritmetica}
            = 8

        Orden Normal
            2 * cuad (head [2,4,5,6,7,8])
            = {def cuadrado}
            = 2 * (head [2,4,5,6,7,8]) * (head [2,4,5,6,7,8])
            = {def head}
            = 2 * (2) * (head [2,4,5,6,7,8])
            = {aritmetoca}
            = 4 * (head [2,4,5,6,7,8])
            = {def head}
            = 4 * (2)
            = {aritmetica}
            = 8
-}

--Ejercicio 2
{-
        Orden Aplicativo
            head (linf)
            = {def linf}
            = head (1 : linf)
            = {def linf}
            = head (1 : ( 1 : linf))
            = {def linf}
            = head (1 : (1 : ( 1 : linf)))

        Orden Normal
            head (linf)
            = {def linf}
            = head (1 : linf)
            = {def head}
            = 1
-}

--Ejercicio 3
{-
        f : : Int −> Int −> Int
        f x 0 = x
        f x n = cuadrado ( f x (n-1) )

        Orden Aplicativo
            f 2 3
            = {def f}
            = cuadrado (f 2 2)
            = {def f}
            = cuadrado (cuadrado f 2 1)
            = {def f}
            = cuadrado (cuadrado (cuadrado f 2 0))
            = {def f}
            = cuadrado (cuadrado (cuadrado (2)))
            = {def cuadrado}
            = cuadrado (cuadrado (2 * 2))
            = {aritmetica}
            = cuadrado (cuadrado 4)
            = {def cuadrado}
            = cuadrado (4 * 4)
            = {aritmetica}
            = cuadrado 16
            = {def cuadrado}
            = 16 * 16
            = {aritmetica}
            = 256
            PASOS REALIZADOS: 10

        Orden Normal
            f 2 3
            = {def f}
            = cuadrado (f 2 2)
            = {def cuadrado}
            = (f 2 2) * (f 2 2)
            = {def f}
            = cuadrado (f 2 1) * (f 2 2)
            = {def cuadrado}
            = ((f 2 1) * (f 2 1)) * (f 2 2)
            = {def f}
            = (cuadrado (f 2 0)) * (f 2 1) * (f 2 2)
            = {def cuadrado}
            = (f 2 0) * (f 2 0) * (f 2 1) * (f 2 2)
            = {def f}
            = 2 * (f 2 0) * (f 2 1) * (f 2 2)
            = {def f}
            = 2 * 2 * (f 2 1) * (f 2 2)
            = {aritmetica}
            = 4 * (f 2 1) * (f 2 2)
            = {def f}
            = 4 * (cuadrado (f 2 0)) * (f 2 2)
            = {def cuadrado}
            = 4 * (f 2 0) * (f 2 0) * (f 2 2)
            = {def f}
            = 4 * 2 * (f 2 0) * (f 2 2)
            = {aritmetica}
            = 8 * (f 2 0) * (f 2 2)
            = {def f}
            = 8 * 2 * (f 2 2)
            = {aritmetica}
            = 16 * (f 2 2)
            = {def f}
            = 16 * cuadrado (f 2 1)
            = {def cuadrado}
            = 16 * (f 2 1) * (f 2 1)
            = {def f}
            = 16 * cuadrado (f 2 0) * (f 2 1)
            = {def cuadrado}
            = 16 * ((f 2 0) * (f 2 0)) * (f 2 1)
            = {def f}
            = 16 * 2 * (f 2 0) * (f 2 1)
            = {aritmetica}
            = 32 * (f 2 0) * (f 2 1)
            = {def f}
            = 32 * 2 * (f 2 1)
            = {aritmetica}
            = 64 * (f 2 1)
            = {def f}
            = 64 * cuadrado (f 2 0)
            = {def cuadrado}
            = 64 * (f 2 0) * (f 2 0)
            = {def f}
            = 64 * 2 * (f 2 0)
            = {aritmetica}
            = 128 * (f 2 0)
            = {def f}
            = 128 * 2
            = {aritmetica}
            = 256
            PASOS REALIZADOS: 29    
-}

--Ejercicio 4
{-
            square :: Int −> Int
            square x = x ∗ x
            inf :: Int
            inf = inf + 1

        Orden Aplicativo
            square (inf)
            = {def inf}
            = square (inf + 1)
            = {def inf}
            = square ((inf + 1) + 1)
            = {def inf}
            = square (((inf + 1) + 1) + 1)

        Orden Normal
            square (inf)
            = {def square}
            = inf * inf
            = {def inf}
            = (inf + 1) * inf
            = {def inf}
            = ((inf + 1) + 1) * inf
-}

--Ejercicio 5
{-
        f : : Int −> Int −> Int
        f x 0 = x
        f x n = cuadrado ( f x (n-1) )

        Reduccion Lazy
            f 2 3
            = {def f}
            = cuadrado (f 2 2)
            = {def cuadrado}
            = x * x
            = x = (f 2 2)
            = [x = cuadrado (f 2 1)]
            = {def cuadrado}
            = x * x
            = [x = y * y
            = y = (f 2 1)
            = {def f}
            = x * x
            = [x = y * y]
            = [y = cuadrado (f 2 0)]
            = {def cuadrado}
            = x * x
            = [x = y * y]
            = [y = z * z]
            = z = (f 2 0)
            = {def f}
            = x * x
            = [x = y * y]
            = [y = z * z]
            = [z = 2]
            = {reemplazo}
            = x * x
            = [x = y * y]
            = [y = 2 * 2]
            = {aritmetica}
            == x * x
            = [x = y * y]
            = [y = 4]
            = {reemplazo}
            = x * x
            = [x = 4 * 4]
            = {aritmetica}
            = x * x
            = [x = 16]
            = {reemplazo}
            = 16 * 16
            = {aritmetica}
            = 256

--Ejercicio 6

    En Haskell, el orden de evaluación está determinado por el sistema de evaluación perezosa (lazy evaluation),
    lo que significa que las expresiones no se evalúan hasta que se necesitan para la evaluación de una expresión 
    mas grande. Por lo tanto, el orden de evaluación no puede ser cambiado en el sentido de que Haskell siempre 
    utilizará una evaluación perezosa.

    Sin embargo, es posible simular una evaluación estricta (eager evaluation) utilizando técnicas como la evaluación
    en profundidad (deepseq) o la estrategia de evaluación "seq".
    Estas tecnicas permiten forzar la evaluación de una expresión antes de que se necesite para la evaluación de otra
    expresión.

    Es importante tener en cuenta que la evaluación estricta puede tener un impacto significativo en el rendimiento
    y en la complejidad de la implementación, ya que puede requerir la evaluación de expresiones que de otra manera no
    se evaluarían. En general, es recomendable utilizar la evaluación perezosa a menos que sea absolutamente necesario
    utilizar la evaluación estricta.


    Aunque en Haskell el orden de evaluación está determinado por la evaluación perezosa, es posible que en algunas
    situaciones específicas se requiera un control más detallado del orden de evaluación. En estos casos, cambiar el
    orden de evaluación puede ser útil para lograr ciertos objetivos, como:
    
        1. Mejorar el rendimiento: En algunos casos, la evaluacion perezosa puede llevar a una sobrecarga en el uso de
           memoria o a un aumento en el tiempo de ejecución. En estos casos, se puede utilizar técnicas como la
           evaluación estricta o la evaluación en profundidad para forzar la evaluación de ciertas expresiones en un
           orden específico y mejorar el rendimiento.
        2. Evitar errores de tiempo de ejecución: En algunos casos, la evaluación perezosa puede llevar a errores de
           tiempo de ejecución debido a la evaluación tardía de ciertas expresiones. En estos casos, se puede utilizar la
           evaluación estricta para forzar la evaluación temprana de ciertas expresiones y evitar errores de tiempo de
           ejecución.
        3. Controlar el orden de efectos secundarios: En Haskell, las funciones puras no tienen efectos secundarios. Sin
           embargo, cuando se utilizan funciones que tienen efectos secundarios, es posible que se desee controlar el
           orden en que se producen estos efectos secundarios. En estos casos, se puede utilizar la evaluación estricta o la
           estrategia de evaluación "seq" para controlar el orden de los efectos secundarios.
        
    En general, cambiar el orden de evaluación en Haskell no es algo que se deba hacer de forma rutinaria, ya que la
    evaluación perezosa es una de las características mas importantes y útiles de Haskell. Sin embargo, en alguunos
    casos específicos, puede ser necesario cambiar el orden de evaluación para lograr ciertos objetivos.


    Un ejemplo en el que se puede cambiar el orden de evaluación en Haskell es cuando se trabaja con expresiones que
    contienen valores infinitos. En la evaluación perezosa de Haskell, una expresión no se evalúa hasta que es necesario
    para la evaluación de otra expresión, lo que significa que una expresión que contiene un valor infinito puede no ser
    evaluada nunca.

    Por ejemplo, la siguiente función que toma una lista infinita de enteros y devuelve la suma de los primeros "n"
    elementos de la lista:

                                sumFirstN :: Int -> [Int] -> Int
                                sumFirstN n xs = sum (take n xs)

    Si se llama a esta función con una lista infinita como argumento, la evaluación perezosa de Haskell no evaluará la
    lista completa, lo que significa que la función nunca terminará:

                                -- Se define una lista infinita de enteros
                                infList = [1..]
                                -- Se llama a la función sumFirstN con la lista infinita como argumento
                                -- Esta función nunca termina debido a la evaluación perezosa de Haskell
                                sumFirstN 10 infList

    En este caso, se puede utilizar la evaluación en profundidad (deepseq) para forzar la evaluación de los primeros "n"
    elementos de la lista antes de sumarlos:

                                import Control.Deepseq (deepseq)
                                -- Se redefine la función sumFirstN utilizando la evaluación en profundidad
                                sumFirstN' :: Int -> [Int] -> Int
                                sumFirstN' n xs = let firstN = take n xs
                                                  in firstN `deepseq` sum firstN

    Al utilizar la evaluación en profundidad en la línea "firstN `deepseq` sum firstN", se fuerza la evaluación de los
    primeros "n" elementos de la lista antes de sumarlos, lo que garantiza que la función siempre terminará, 
    independientemente de si la lista es finita o infinita
-}