{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Currere.Monad where

import           Data.Map (Map)
import qualified Data.Map as Map

import           Control.Monad.Reader

data Connection = Connection
  deriving (Eq, Show)

type Config = Map String String
type Env = [(String, String)]

data Ctx = Ctx
  { _conn :: !Connection
  , _config :: !Config
  , _env :: !Env
  }

initCtx :: IO Ctx
initCtx = Ctx
  <$> return Connection
  <*> return Map.empty
  <*> return []

newtype CurrereM a = CurrereM
  { unCurrereM :: ReaderT Ctx IO a
  } deriving ( Functor
             , Applicative
             , Monad
             , MonadIO
             , MonadReader Ctx
             )

runCurrereM :: Ctx -> CurrereM a -> IO a
runCurrereM ctx = flip runReaderT ctx . unCurrereM

useConnection :: CurrereM Connection
useConnection = _conn <$> ask

useConfig :: CurrereM Config
useConfig = _config <$> ask

useEnv :: CurrereM Env
useEnv = _env <$> ask

liftCurrereM :: IO a -> CurrereM a
liftCurrereM = liftIO
