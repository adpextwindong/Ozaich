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

data Reward = Reward {
                questPointsReward :: Int
               ,skillPointsReward :: M.Map Skill Experience
               ,itemsReward :: M.Map Item Int
              } deriving (Show, Eq, Ord)

data Membership = FreeToPlay | PayToPlay
    deriving (Show, Eq, Ord)

data QClassification = Novice
                     | Intermediate
                     | Experienced
                     | Master
                     | Grandmaster
                     | Special
                     deriving (Show, Eq, Ord)

data Quest = Quest {
                name :: String
               ,qt :: Membership --TODO better name
               ,classification :: QClassification
               ,levels :: LevelReqs
               ,parents :: S.Set Quest
               ,questPoints :: Int --0 indicates no qp constraint
               ,itemsRequired :: !(M.Map Item Int) --Item Count
               --Strict to force grabCannonicalE to error if nonexistant item
               ,reward :: Reward
             } deriving (Show, Eq, Ord)


--TODO another consideration is implicit ironman constraints.
--Knights sword has a Cooking level 10 constraint for ironmen

--TODO we might need to split ItemConstraints into HardItemConstraints and RecommendedItemConstraints
--There are items we fetch during other quests typically that we don't want to backtrack for such as Goutweed
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
                                  then do
                                    let maxImplicit = maxQPImplicit q
                                    if maxImplicit == 0
                                    then S.empty
                                    else S.singleton $ QuestPointConstraintImplicit maxImplicit
                                  else S.singleton $ QuestPointConstraintExplicit (questPoints q)
