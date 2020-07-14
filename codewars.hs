#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
-}

import           Data.Char

toCamelCase :: String -> String
toCamelCase []    = []
toCamelCase [str]
  | str == '-' || str == '_' = []
  | otherwise                = [str]
toCamelCase (a:[str])
  | a == '-' = [toUpper str]
  | a == '_' = [toUpper str]
  | otherwise = a : [str]
toCamelCase (a:b:str)
  | null str && (a == '-' || a == '_') = [toUpper b]
  | a == '-' || a == '_'               = toCamelCase (toUpper b : str)
  | otherwise                          = a : toCamelCase (b : str)

main = do
  str <- getLine
  putStr $ toCamelCase str
