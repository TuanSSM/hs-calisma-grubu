import Data.List
import Data.Maybe

-- 18 Aralik Carsamba
-- Ikinci Ders

-- Section 0 -- Recall

-- Guards | Plekumatlar Yakalayin!
-- Parcali fonksiyon tanimlamamizi saglar

comparison x y | x < y     = "Ilki ikincisinden kucuk"
               | x > y     = "Ikincisi daha kucuk"
               | otherwise = "Esitler"

fonk :: [Integer] -> Integer
fonk [] = 1
fonk (x:xs)
    | even x    = (x - 2) * fonk xs
    | otherwise = fonk xs

fonk' = product . map (subtract 2) . filter even

-- Remember that we can define map in terms of foldr
map' f []     = []
map' f (x:xs) = f x : map'' f xs

map'' f = foldr (\x xs -> (f x):xs) [] 


-- We can define any primitive computable function in terms of folds
-- i.e. any function which is a for loop (Not containing any while loop)

-- Collatz Conjecture
-- Finding largest collatz sequence in a given range

collatz :: Integer -> Integer
collatz 1 = 1
collatz x
    | even x    = x `div` 2
    | x <= 0    = error "Enter a positive integer"
    | otherwise = 3*x + 1

collatzSeq' = takeWhile (>1) . iterate collatz 

collatzSeq :: Integer -> [Integer]
collatzSeq = terminate . iterate collatz
            where terminate (1:_)  = [1]
                  terminate (x:xs) = x:terminate xs


collatzRangeSeq x y = map (length . collatzSeq) [x..y] 

maxCollatz x y = maximum $ collatzRangeSeq x y

-- Consider this code
-- After Maybe


-- Section 2 -- Data Constructors

data RuhHali = Meh | Iyi deriving (Show)

modDegistir Meh = Iyi
modDegistir _   = Meh

data Triple a b c = Triple a b c

tripleFst (Triple x y z) = x
tripleSnd (Triple x y z) = y
tripleTrd (Triple x y z) = z

data Quadruple a b = Quadruple a a b b

firstTwo (Quadruple w x y z) = [w,x]
lastTwo (Quadruple w x y z) = [y,z]


data Belki a = Hic
             | Sadece a
           deriving (Show)

-- Programa bos bir liste verildiginde cokmemesi icin

firstElement :: [a] -> Belki a
firstElement []     = Hic
firstElement (x:xs) = Sadece x

-- 

data Liste a = Bos | Eleman a (Liste a)
            deriving (Show, Eq)

head' :: Liste a -> Belki a
head' Bos          = Hic
head' (Eleman x _) = Sadece x

head'' [] = Nothing
head'' (x:xs) = Just x

--

ilkHangisi :: (a -> Bool) -> [a] -> Belki a
ilkHangisi p [] = Hic
ilkHangisi p (x:xs) =
    if p x then Sadece x
           else ilkHangisi p xs

-- ilkHangisi (==7) [1..100]
-- ilkHangisi (\x -> x == x*x) [1..100]
-- ilkHangisi (\x -> length x == 10) ["0987654321","str","string"]

-- Recall foldr

factorial n = foldr (*) 1 [1..n]

-- Recall duals

collatz' :: Integer -> Maybe (Integer, Integer)
collatz' 0 = Nothing
collatz' 1 = Just (1,0)
collatz' x = if odd x
                then Just (x, 3*x + 1)
                else Just (x, x `div` 2)

--

collatzSequence :: Integer -> [Integer]
collatzSequence = unfoldr collatz'
                where
                    collatz' 0 = Nothing
                    collatz' 1 = Just (1,0)
                    collatz' x = if odd x
                                    then Just (x,3*x + 1)
                                    else Just (x, x `div` 2)

-- Note That
-- The unfoldr function is a `dual' to foldr: while
-- foldr reduces a list to a summary value, unfoldr builds
-- a list from a seed value. The function takes the element and returns
-- Nothing if it is done producing the list or returns Just
-- (a,b), in which case, a is a prepended to the list
-- and b is used as the next element in a recursive call.

-- data Either a b = Left a
--                 | Right b

-- data Tup a b c d = Tek a
--                  | Iki a b
--                  | Uc a b c
--                  | Dort a b c d
-- 
-- tup1 (Tek  w      ) = Just w
-- tup1 (Iki  w x    ) = Just w
-- tup1 (Uc   w x y  ) = Just w
-- tup1 (Dort w x y z) = Just w
-- 
-- tup2 (Tek  w      ) = Nothing
-- tup2 (Iki  w x    ) = Sadece w
-- tup2 (Uc   w x y  ) = Sadece w
-- tup2 (Dort w x y z) = Sadece w
-- 
-- tup3 (Tek  w      ) = Nothing
-- tup3 (Iki  w x    ) = Nothing
-- tup3 (Uc   w x y  ) = Just w
-- tup3 (Dort w x y z) = Just w
-- 
-- tup4 (Tek  w      ) = Hic
-- tup4 (Iki  w x    ) = Hic
-- tup4 (Uc   w x y  ) = Hic
-- tup4 (Dort w x y z) = Sadece w

data BinaryTree a
    = Leaf a
    | Branch (BinaryTree a) a (BinaryTree a)

treeSize (Leaf x) = 1
treeSize (Branch left x right) =
     1 + treeSize left + treeSize right

data Renkler
    = Kirmizi
    | Turuncu
    | Sari
    | Yesil
    | Mavi
    | Mor
    | Beyaz
    | Siyah
    | Ozel Int Int Int -- R G B
    deriving (Show,Eq)

colorToRGB Kirmizi      = (255,0,0)
colorToRGB Turuncu      = (255,128,0)
colorToRGB Sari         = (255,255,0)
colorToRGB Yesil        = (0,255,0)
colorToRGB Mavi         = (0,0,255)
colorToRGB Mor          = (255,0,255)
colorToRGB Beyaz        = (255,255,255)
colorToRGB Siyah        = (0,0,0)
colorToRGB (Ozel r g b) = (r,g,b)

rgbToColor 255 0   0   = Sadece Kirmizi     
rgbToColor 255 128 0   = Sadece Turuncu     
rgbToColor 255 255 0   = Sadece Sari        
rgbToColor 0   255 0   = Sadece Yesil       
rgbToColor 0   0   255 = Sadece Mavi        
rgbToColor 255 0   255 = Sadece Mor         
rgbToColor 255 255 255 = Sadece Beyaz       
rgbToColor 0   0   0   = Sadece Siyah       
rgbToColor r   g   b   =
    if 0 <= r && r <= 255 && 
       0 <= g && g <= 255 && 
       0 <= b && b <= 255
      then Sadece (Ozel r g b)
      else Hic    -- Gecersiz RGB degeri

rgbIsValid r g b = rgbIsValid' (rgbToColor r g b)
    where rgbIsValid' (Sadece _) = True
          rgbIsValid' _          = False

-- Iskambil

data Yuz = Bir | Iki | Uc | Dort | Bes | Alti | Yedi | Sekiz | Dokuz | On
         | Vale | Kiz | Papaz | As
       deriving (Show, Enum)

data Renk = Kupa | Sinek | Karo | Maca
       deriving (Show, Enum)

deste = [ (renk, yuz) | renk <- [Kupa ..], yuz <- [Bir ..] ]

-- Type

type Ad = String
type Numara = Integer
type Bolum = String
type Mail = String

data Ogrenci = Ogrenci Ad Numara Bolum
            deriving (Show)

mailMetu :: Ogrenci -> Mail
mailMetu (Ogrenci a n b) = "e" ++ (init $ show n) ++ "@metu.edu.tr"


