-- 2 
import Data.Char
import Data.List

commonWords :: Int -> String -> String
commonWords n xs = concat $ map showRun $ take n $ countWords $ map toLower xs

countWords :: String -> [(Int,String)]
countWords xs = reverse $ sort $ map (\w -> (length w, head w)) $ group $ sort $ words xs

showRun :: (Int,String) -> String
showRun (a,b) = show a ++ " - " ++ b ++ "\n"

