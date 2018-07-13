main :: IO ()
main = f <<= putStrLn

f :: IO [Char]
f = do
    text <- readFile "text.txt"
    sum $ map read (words text)

