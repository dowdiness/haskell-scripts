#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
-}

solve :: Int -> String
solve day
  | day == 25 = "Christmas"
  | day == 24 = "Christmas Eve"
  | day == 23 = "Christmas Eve Eve"
  | day == 22 = "Christmas Eve Eve Eve"
  | otherwise = "Not Christmas"

main :: IO ()
main = do
  n <- getLine
  putStr $ solve $ read n
