module Main where

import Oziach.Types (genConstraints)
import Oziach.Quests (cooksAssistant)

--Lay out some initial Haskell datatypes while we think and look around for planning stuff

main :: IO ()
main = print $ genConstraints cooksAssistant
