module Oziach.Types where

import Oziach.Items

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Bifunctor
import Control.Applicative

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
