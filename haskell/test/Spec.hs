import Lib

printIt :: (Float, Float, Float) -> String
printIt = undefined

main :: IO ()
main = readPoints >>= (putStrLn . unlines . (map show))