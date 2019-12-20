-- > import Prelude hiding (foldr, foldl)
import Prelude hiding (foldl, foldr)
-- 

fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fib (n-1) + fib (n-2)

fibos :: Int -> [Int]
fibos n = map (\x -> fib x) [1..n]

ilk :: (a,b,c) -> a
ilk (x,_,_) = x
-- _ herhangi bir sey olabilir ve bunu umursamaz

ikinci :: (a,b,c) -> b
ikinci (_,y,_) = y

ucuncu :: (a,b,c) -> c
ucuncu (_,_,z) = z

length' :: (Num b) => [a] -> b
length' []     = 0
length' (_:xs) = 1 + length' xs

head' :: [a] -> a
head' [] = error "bos liste"
head' (x:xs) = x

--
--

map' :: (a -> b) -> [a] -> [b] 
map' _ []     = []
map' f (x:xs) = f x : map' f xs

-- Pattern Matching
-- --
-- f bir motiftir ve bu her sey ile eslenebilir demektir
-- herhangi bir sey olabilir
--
-- (x:xs) de bir baska motiftir.
-- matches a non-empty list which is formed by something (which gets bound to the x variable) which was cons'd (by the (:) function) onto something else (which gets bound to xs)
-- Buradaki x ve xs aslinda birer alt-motiftir

-- [] bos listeyi yakalar


-- Bind variables
-- f, x ve xs degiskenleri

--- Break down
-- eslesen bir argumani (bos liste degil) (x:xs) orneginde gordugumuz gibi parcalara ayirabilmemizi sagliyor
-- (:)
-- (++)
--- Constructor'lar ile baglantisi
-- dropThree ([x,y,z] ++ xs) = xs
-- 
-- calismayacaktir cunku (++) motif aramada kabul edilmiyor.
-- diger bir cok listelerde calisan fonksiyon kabul edilmiyor

