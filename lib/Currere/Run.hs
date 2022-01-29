module Currere.Run
  ( mainWithArgs
  , defaultMain
  ) where

import System.Environment (getArgs)

import Currere.Monad

mainWithArgs :: [String] -> IO ()
mainWithArgs args = flip runCurrereM Ctx $ do
  env <- askCtx
  liftCurrereM $ print env

defaultMain :: IO ()
defaultMain = getArgs >>= mainWithArgs