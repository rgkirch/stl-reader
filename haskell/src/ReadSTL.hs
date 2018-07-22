module ReadSTL
    ( parsePoints
    ) where

import qualified Data.Text as T
import Data.List
import Debug.Trace

startsWith :: String -> String -> Bool
startsWith [] x = True
startsWith (a:as) (b:bs)
    | a == b = startsWith as bs
    | otherwise = False

hasVertex :: String -> Bool
hasVertex = startsWith "vertex"

dropPrefix :: String -> String
dropPrefix = dropWhile (' ' ==) . dropWhile (' ' /=)

tuplify :: String -> (Float, Float, Float)
tuplify = (\(a:b:c:_) -> (a, b, c)) . (map read) . words

parsePoints :: String -> [(Float, Float, Float)]
parsePoints = (map tuplify)
    . (map dropPrefix)
    . (filter hasVertex)
    . (map $ dropWhile (' '==))
    . lines

