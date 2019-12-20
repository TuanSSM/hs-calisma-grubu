length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

length2 :: [a] -> Int
length2 xs = sum [1 | _ <- xs]

head' :: [a] -> a
head' (x:xs) = x

ilk :: (a,b,c) -> a
ilk (x,_,_) = x

fermuarla f (x:xs) (y:ys) = f x y : fermuarla f xs ys
fermuarla f _       _     = []

fermuar :: [a] -> [b] -> [(a,b)]
fermuar (x:xs) (y:ys) = (x,y) : fermuar xs ys
fermuar _       _     = []

foldr' f z [] = z
foldr' f z (x:xs) = x `f` foldr' f z xs

foldl' f z [] = z
foldl' f z (x:xs) = foldl' f (f z x) xs

transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose x = (map head x) : transpose (map tail x)
