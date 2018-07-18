module LinearSpec where

import Linear.Metric
import Linear.V3

main :: IO ()
main = do
  let
    a = V3 1 3 (-5)
    b = V3 4 (-2) (-1)
    c = a `dot` b
  putStrLn $ show c