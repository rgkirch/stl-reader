module RosettaSpec where

import Rosetta

crossTest :: IO ()
crossTest = do
    let
        a = [1, 3, (-5)]
        b = [4, (-2), (-1)]
        c = cross a b
    putStrLn $ show c

dotTest :: IO ()
dotTest = do
    let
        a = [1, 3, (-5)]
        b = [4, (-2), (-1)]
        c = dot a b
    putStrLn $ show c

main :: IO ()
main = do
    dotTest
    crossTest
    -- angleTest