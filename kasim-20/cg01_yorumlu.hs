--- ":" bir fonksiyondur
--- ":" fonksiyonunun tipi a -> [a] -> [a]
--- GHCi'da ":type (:)" yazarsak bize bu tipi gosterecektir.

listeyeEkle :: a -> [a] -> [a]
listeyeEkle x xs = x : xs

-- denkligin sol ve sag taraflarinde motif yakalama ile yerine yerlestirme yapilir

listeyeEkle' :: a -> [a] -> [a]
listeyeEkle' x xs = [ birEleman | birEleman <- x:xs ]

head' :: [a] -> a
head' (x:xs) = x

length' :: [a] -> Int
length' []     = 0
length' (x:xs) = 1 + length xs
-- Geri donuslu (recursive) ifade edilebilir kullanilabilir
-- Base Statement -- Bos listeyi yakaladiginda ne yapmasi gerektigini ifade etmekte fayda var
-- "(x:xs)" bir elemandir ve x : xs fonksiyonu sonucunda [x,xs] i olusturur.

length'' :: [a] -> Int
length'' xs = sum [1 | _ <- xs]
--- length fonksiyonunu liste seklinde olusturalim

divisors :: Int -> [Int]
divisors x = [d | d <- [1..x], x `mod` d == 0]

isPrime :: Int -> Bool
isPrime x = if (length $ divisors x) == 2 then True else False

pDivs x = [ p | p <- divisors x, isPrime p ]

pfactors :: Int -> [Int]
pfactors n = [ p | p <- divisors n, isPrime p ]

-- asal carpanlarini kuvvetleriyle vermesi icin listeledigimizde dusuk kuvvetlerini atmasi icin
-- daha iyi bir yolu olmali

kucuguAt :: [(Int,Int)] -> [(Int,Int)]
kucuguAt (x:[])             = x : []
kucuguAt (x:xs) | a == b    = kucuguAt xs
                | otherwise = x : kucuguAt xs
                where a = fst x
                      b = fst $ head xs

-- kuvveti 10'a kadar olan sayilari aldik daha iyi bir fonksiyon bulunabilir

allPPfactors n = [ (p,k) | p <- pfactors n, k <- [1..10], n `mod` (p^k) == 0] 

ppfactors :: Int -> [(Int,Int)]
ppfactors = kucuguAt . allPPfactors
-- (.) fonksiyon carpimidir 

dikacu :: Int -> [(Int,Int,Int)]
dikacu n = [ (x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x*x + y*y == z*z, x <= y]
-- Buradaki _ "dont care" umursama anlamina gelen bir motiftir ve xs listesinden aldigi elemani bir yerde kullanmaz
-- Her aldigi eleman icin listeye bir ekler
-- xs serbest secilebilir

otele :: (a -> a) -> a -> [a]
otele f a = f a : otele f a

replika :: (Integral a) => a -> b -> [b]
replika t x = [ x | _ <- [1..t]]

replika' :: (Integral a) => a -> b -> [b]
replika' 0 _ = []
replika' t x = x : replika' (t-1) x

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = (f x) : map' f xs

--- map fonksiyonunu liste olarak da ifade edebilir.
haritaListe f xs = [ f x | x <- xs ]

filter' p (x:xs) = p x : filter' p xs

filtreListe p xs = [x | x <- xs, p x]

zip' :: [a] -> [b] -> [(a,b)]
zip' (x:xs) (y:ys) = (x,y) : zip xs ys
zip' _       _     = []
--- ilk liste veya ikinci listenin bos olmalari durumlarini, ayri ayri ifade etmedik. Her turlu durumda artan elemani almak istemedigimizi dusunelim.

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' f _      _      = []

--- Aslinda "zip " fonksiyonunu "zipWith (,)" ile belirtebiliyoruz

foldr' f z []     = []
foldr' f z (x:xs) = x `f` z : foldr' f z xs
-- listenin sag tarafindan ilk elemani z degeri ile f fonksiyonuna sokar ardindan sonucu 2. elemanla f fonksiyonuna onun sonucunu 3. elemanla...
