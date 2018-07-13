module Lib
    ( readPoints
    ) where

import qualified Data.Text as T
import Data.List

startsWith :: String -> String -> Bool
startsWith [] x = True
startsWith (a:as) (b:bs)
    | a == b = startsWith as bs
    | otherwise = False

readPoints :: IO ()
readPoints = do
    contents <- readFile "standee.stl"
    let
        stripped = map (dropWhile (' ' ==)) $ lines contents
        verticies = filter (startsWith "vertex") stripped
        in
        putStrLn $ intercalate "\r\n" verticies
