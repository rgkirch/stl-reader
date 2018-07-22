module ReadPointsSpec where

import ReadSTL

main :: IO [(Float, Float, Float)]
main = readFile "standee.stl" >>= (return . parsePoints)

-- readPoints >>= (putStrLn . unlines . (map show))