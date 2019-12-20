-- Matrix Multiplication
matrixMult :: Num a => [[a]] -> [[a]] -> [[a]]
matrixMult x y  | sx == sy  = matrixMultT x $ transpose y
                | otherwise = error "not correct sizes"
                where sx = map (\l -> length l) x
		               sy = map (\l -> length l) y

matrixMultT :: Num a => [[a]] -> [[a]] -> [[a]]
matrixMultT [] _ = []
matrixMultT (a:as) b = calcRow a b : matrixMultT as b

calcRow :: Num a => [a] -> [[a]] -> [a]
calcRow _ [] = []
calcRow a (b:bs) = calcCell a b : calcRow a bs

calcCell :: Num a => [a] -> [a] ->a
calcCell col row = sum $ zipWith (*) col row

transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose x = (map head x) : transpose (map tail x)

{- Tensor
tensor :: Num a => [[a]] -> [[a]] -> [[a]]
tensor x y =
-}
