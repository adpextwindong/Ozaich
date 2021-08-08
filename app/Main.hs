module Main where

--Lay out some initial Haskell datatypes while we think and look around for planning stuff

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Bifunctor

--TODO find a canonical list for item id's
--
type Item = Int
type Level = Int
type Experience = Int

data Skill = Attack | Strength | Defence | Range | Prayer | Magic
           | Runecraft | Construction | Hitpoints | Agility | Herblore
           | Thieving | Crafting | Fletching | Slayer | Hunter
           | Mining | Smithing | Fishing | Cooking | Firemaking | Woodcutting | Farming
           deriving (Show, Eq, Ord)


--TODO We might need a datakind for Level to express boostable and unboostable requirements
type LevelReqs = M.Map Skill Level

data Quest = Quest {
                name :: String
               ,levels :: LevelReqs
               ,parents :: S.Set Quest
               ,qp_constraint :: Int --0 or Maybe?
               ,items_required :: !(M.Map Item Int) --Item Count
             } deriving (Show, Eq, Ord)

cooksAssistant = Quest {
                    name = "Cook's Assistant"
                   ,levels = M.fromList []
                   ,parents = S.fromList [] --What if we had a partial ordering for quests??
                   ,qp_constraint = 0
                   ,items_required = nameCountToReqMap [("Pot",1),("Bucket",1),("Bucket of Milk",1), ("Egg", 1), ("Pot of flour", 1)]
                 }

cannonical_items :: M.Map String Item
cannonical_items = M.fromList [("Pot",1931),("Bucket",1925),("Bucket of Milk",1927), ("Egg", 1944), ("Pot of flour", 1933)]

grabCannonicalE :: String -> Item
grabCannonicalE s = cannonical_items M.! s

nameCountToReqMap = M.fromList . fmap (first grabCannonicalE)

--TODO layout RFD expression
--TODO Heroes Quest expression
main :: IO ()
main = putStrLn "Hello, Haskell!"
