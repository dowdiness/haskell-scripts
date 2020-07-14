#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
-}

{-# LANGUAGE TypeApplications #-}

main :: IO ()
main = do
  _ : costs <- map (read @Int) . lines <$> getContents
  putStr $ show $ sum costs - maximum costs `div` 2
