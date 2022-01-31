module Currere.Run
  ( mainWithArgs
  , defaultMain
  ) where

import System.Environment (getArgs)

import Currere.Monad

mainWithArgs :: [String] -> IO ()
mainWithArgs _ = do
  ctx <- initCtx
  
  runCurrereM ctx $ do
    conn <- useConnection
    config <- useConfig
    env <- useEnv

    liftCurrereM $ print (conn, config, env)

defaultMain :: IO ()
defaultMain = getArgs >>= mainWithArgs