{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GADTs #-}

module Main where

import Control.Concurrent (threadDelay)
import System.Console.CmdArgs

data Opts where
  Opts :: {delay :: Int} -> Opts
  deriving (Show, Data, Typeable)

opts :: Opts
opts = Opts {delay = 10000000 &= help "Delay in mikrosecounds"} &= summary "Simple pause program"

main :: IO ()
main = do
  lopts <- cmdArgs opts
  -- read stdin
  content <- getContents
  threadDelay $ delay lopts
  putStr content
