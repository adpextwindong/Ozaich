module Main where

--Lay out some initial Haskell datatypes while we think and look around for planning stuff

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Bifunctor
import Control.Applicative

--TODO find a canonical list for item id's
--
type Item = Int
type Level = Int
type Experience = Int

data Skill = Attack | Strength | Defence | Range | Prayer | Magic
           | Runecraft | Construction | Hitpoints | Agility | Herblore
           | Thieving | Crafting | Fletching | Slayer | Hunter
           | Mining | Smithing | Fishing | Cooking | Firemaking | Woodcutting | Farming
           deriving (Show, Eq, Ord, Enum, Bounded)

--Enum and Bounded are for the list comprehension
baseSkills :: M.Map Skill Integer
baseSkills = M.fromList $ liftA2 (,) [Attack .. Farming] [1]

--TODO We might need a datakind for Level to express boostable and unboostable requirements
type LevelReqs = M.Map Skill Level

data Quest = Quest {
                name :: String
               ,levels :: LevelReqs
               ,parents :: S.Set Quest
               ,questPoints :: Int --0 indicates no qp constraint
               ,itemsRequired :: !(M.Map Item Int) --Item Count
               --Strict to force grabCannonicalE to error if nonexistant item
             } deriving (Show, Eq, Ord)

cooksAssistant = Quest {
                    name = "Cook's Assistant"
                   ,levels = M.fromList []
                   ,parents = S.fromList [] --What if we had a partial ordering for quests??
                   ,questPoints = 0
                   ,itemsRequired = nameCountToReqMap [("Pot",1),("Bucket",1),("Bucket of Milk",1), ("Egg", 1), ("Pot of flour", 1)]
                 }

cannonicalItems :: M.Map String Item
cannonicalItems = M.fromList [("Pot",1931),("Bucket",1925),("Bucket of Milk",1927), ("Egg", 1944), ("Pot of flour", 1933)]

grabCannonicalE :: String -> Item
grabCannonicalE s = cannonicalItems M.! s

nameCountToReqMap = M.fromList . fmap (first grabCannonicalE)

data Constraint = LevelConstraint Skill Level
                | ItemConstraint Item Int
                | QuestReqConstraint Int
                | QuestPointConstraintExplicit Int
                | QuestPointConstraintImplicit Int
                deriving (Show, Ord, Eq)

--TODO test this on a quest with implicit qp reqs like Throne of Miscellenia
maxQPImplicit :: Quest -> Int
maxQPImplicit q = foldr max (questPoints q) parentQPReqs
    where parentQPReqs = maxQPImplicit <$> S.toList (parents q)

genConstraints :: Quest -> S.Set Constraint --TODO make this recursive in quest dependencies
genConstraints q = S.unions [levelConstraints, itemConstraints, questPointConstraints]
    where levelConstraints = S.fromList . fmap (uncurry LevelConstraint) $ M.toList (levels q)
          itemConstraints = S.fromList . fmap (uncurry ItemConstraint) $ M.toList (itemsRequired q)
          questPointConstraints = if questPoints q == 0
                                  then S.singleton $ QuestPointConstraintImplicit (maxQPImplicit q)
                                  else S.singleton $ QuestPointConstraintExplicit (questPoints q)



--What if we made an intermediate constraint type

--TODO layout RFD expression
--TODO Heroes Quest expression
main :: IO ()
main = putStrLn "Hello, Haskell!"
