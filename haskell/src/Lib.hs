module Lib
    ( readPoints
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

f :: String -> String
f = unlines
    . (map dropPrefix)
    . (filter hasVertex)
    . (map $ dropWhile (' '==))
    . lines

readPoints :: IO String
readPoints = readFile "standee.stl" >>= (return . f)
    -- (\contents -> let
    --     stripped = map (dropWhile (' ' ==)) $ lines contents
    --     verticies = filter (startsWith "vertex") stripped
    --     dropLeadingWord = (dropWhile (' ' ==)) . (dropWhile (' ' /=))
    --     result = map dropLeadingWord verticies
    --     in
    --     map g result
