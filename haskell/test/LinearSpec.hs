module LinearSpec where

import Linear

-- angleTest :: IO ()
-- angleTest = do
--   let
--     a = V3 1 3 (-5)
--     b = V3 4 (-2) (-1)
--     c = (angle a b :: Double
--   putStrLn $ show c

crossTest :: IO ()
crossTest = do
  let
    a = V3 1 3 (-5)
    b = V3 4 (-2) (-1)
    c = a `cross` b
  putStrLn $ show c

dotTest :: IO ()
dotTest = do
  let
    a = V3 1 3 (-5)
    b = V3 4 (-2) (-1)
    c = a `dot` b
  putStrLn $ show c

main :: IO ()
main = do
  dotTest
  crossTest
  -- angleTest