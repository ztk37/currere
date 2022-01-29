{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Currere.Monad where

import Control.Monad.Reader

data Ctx = Ctx
  deriving (Eq, Show)

newtype CurrereM a = CurrereM
  { unCurrereM :: ReaderT Ctx IO a
  } deriving ( Functor
             , Applicative
             , Monad
             , MonadReader Ctx
             , MonadIO
             )

runCurrereM :: CurrereM a -> Ctx -> IO a
runCurrereM = runReaderT . unCurrereM

askCtx :: CurrereM Ctx
askCtx = ask

liftCurrereM :: IO a -> CurrereM a
liftCurrereM = liftIO
