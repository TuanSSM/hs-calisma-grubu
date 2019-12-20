import Data.List
import Data.Maybe

benikarele x = x*x

compare' :: Int -> Int -> String
compare' x y | x > y     =  "Ilki ikincisinden kucuk"
           | x < y     = "Ikincisi daha buyuk"
            | otherwise = "Esitler"

collatz :: Int -> Int
collatz x  | even x    = x `div` 2 
           | otherwise = 3*x + 1

collatzSeq = takeWhile (>1) . iterate collatz
collatzSeq' = terminate . iterate collatz
            where terminate (1:_)  = [1]
                  terminate (x:xs) = x:terminate xs

collatzRange n m = map (\x -> length $ collatzSeq' x) [n..m]


data Ruhhali = Eyi | Yorgun
            deriving (Show)

modDegistir Eyi = Yorgun
modDegistir _   = Eyi

data Ogrenci = Ogrenci String Int String
            deriving (Show, Read)

metuMail (Ogrenci ad numara _) = "e" ++ (init $ show numara) ++ "@metu.edu.tr"

data UcluTup a b c = UcluTup a b c
                   deriving (Show)

ilk (UcluTup x _ _) = x


data Tupler a b c = Tekli a 
                  | Ikili a b
                  | Uclu a b c
                   deriving (Show)

ilki (Tekli x) = x
ilki (Ikili x y) = x
ilki (Uclu x _ _) = x
 
data Belki a = Hiic | Sadece a 
             deriving (Show)

head' :: [a] -> Belki a
head' [] = Hiic
head' (x:xs) = Sadece x

data Tree a = Leaf a
            | Branch (Tree a) a (Tree a)
            deriving (Show)

sizeTree :: Tree a -> Int
sizeTree (Leaf x) = 1
sizeTree (Branch sol orta sag) = sizeTree sol + 1 + sizeTree sag

collatzSeq'' = unfoldr $ collatz'
           where
            collatz' 0 = Nothing
            collatz' 1 = Just (1,0)
            collatz' x = if odd x
                    then Just (x,3*x+1)
                    else Just (x,x `div` 2)

data Yuz = Bir | Iki | Uc | Dort | Bes | Alti
         | Yedi | Sekiz | Dokuz | On
         | Vale | Kiz | Papaz | As
         deriving (Show, Enum)

data Renk = Kupa | Sinek | Karo | Maca
          deriving (Show, Enum)














