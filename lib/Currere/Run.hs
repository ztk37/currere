module Currere.Run
  ( mainWithArgs
  , defaultMain
  ) where

import System.Environment (getArgs)

mainWithArgs :: [String] -> IO ()
mainWithArgs = print

defaultMain :: IO ()
defaultMain = getArgs >>= mainWithArgs