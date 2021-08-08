module Main where

import Oziach

import qualified Data.Set as S
--Lay out some initial Haskell datatypes while we think and look around for planning stuff

main :: IO ()
main = print $ S.unions $ genConstraints <$> quests
