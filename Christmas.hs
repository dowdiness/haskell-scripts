#!/usr/bin/env stack
{- stack script
  --resolver lts-15.16
  --package "bytestring vector array"
-}

{-# LANGUAGE TypeApplications #-}

import           Control.Monad
import           Data.Array
import qualified Data.ByteString.Char8 as BS
import           Data.List
import qualified Data.Vector.Unboxed   as VU

--Input functions with ByteString
readInt = fst . fromJust . BS.readInteger
readIntList = map readInt . BS.words

getIntList = readIntList <$> BS.getLine

b n = (2^(n+2)) - 3
p n = (2^(n+1)) - 1

main :: IO ()
main = do
  [n, x] <- getIntList
  return

-- P
-- BPPPB
-- B BPPPB P BPPPB B
-- BB BPPPB P BPPPB BPB BPPPB P BPPPB BB
-- BBB BPPPB P BPPPB BPB BPPPB P BPPPB B BPB B BPPPB P BPPPB BPB BPPPB P BPPPB BBB

-- 1 5 13 29 61
