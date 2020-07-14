#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
-}

step :: Char -> Int
step '(' = 1
step ')' = -1

validParentheses :: String -> Bool
validParentheses str = laze && nega
  where
    laze = (== 0) $ last list
    nega = all (>= 0) list
    list = scanl (+) 0 $ map step str

main = do
  str <- getLine
  putStr $ show $ validParentheses str

--The Kmett Way

data B = B Int Int
    deriving Eq

instance Monoid B where
  B xa xb `mappend` B ya yb
    |  xb <= ya = B (xa + ya - xb) yb
    | otherwise = B xa (xb + yb - ya)

  mempty = B 0 0


parse '(' = B 0 1
parse ')' = B 1 0
parse _   = B 0 0

validParentheses :: String -> Bool
validParentheses = (== mempty) . foldMap parse
