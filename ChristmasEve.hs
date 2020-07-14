#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
  --package "vector array"
-}

{-# LANGUAGE TypeApplications #-}

import           Control.Monad
import           Data.Array
import           Data.List
import qualified Data.Vector.Unboxed as VU

-- comb :: Int -> [a] -> [[a]]
-- comb 0 _      = [[]]
-- comb _ []     = []
-- comb n (x:xs) = [x:y | y <- comb (n-1) xs] ++ comb n xs

calc :: Array Int Int -> Int -> Int -> Int -> Int
calc hs i k m
  | i < k = m
  | m == 0 = 0
  | otherwise = calc hs (i - 1) k m'
  where
    x = hs ! i - hs ! (i - (k - 1))
    m'
      | m > x = x
      | otherwise = m

-- solve :: [Int] -> Int -> Int
-- solve t n = spl
--   where
--     vt = VU.fromList t
--     subL = VU.concat $ VU.forM (VU.fromList [1..VU.length vt - 1]) $ \x ->
--       return $ (vt VU.! (x - 1)) - (vt VU.! x)
--     spl = minimum . map (abs . sum) . comb (n-1) $ VU.toList subL

main :: IO ()
main = do
  _ : [n] <- map (read @Int) . words <$> getLine
  trees <- map (read @Int) . lines <$> getContents
  let trees' = sort trees
  let trees'' = listArray (1, length trees') trees'
  putStr $ show $ calc trees'' (length trees'') n (10 ^ 9 + 1)
