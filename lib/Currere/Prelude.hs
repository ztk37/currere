module Currere.Prelude where

(|>) :: a -> (a -> b) -> b
a |> f = f a
{-# INLINE (|>) #-}
infixl 8 |>