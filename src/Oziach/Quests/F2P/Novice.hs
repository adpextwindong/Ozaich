module Oziach.Quests.F2P.Novice where

import Oziach.Types
    ( Quest(..),
      Membership(FreeToPlay), 
      QClassification(Novice),
      Skill(..),
      Reward(..))

import Oziach.Items ( nameCountToReqMap )

import qualified Data.Map as M
import qualified Data.Set as S

noviceF2PQuests :: [Quest]
noviceF2PQuests = [cooksAssistant]

cooksAssistant :: Quest
cooksAssistant = Quest {
                    name = "Cook's Assistant"
                   ,qt = FreeToPlay
                   ,classification = Novice
                   ,levels = M.empty
                   ,parents = S.empty
                   ,questPoints = 0
                   ,itemsRequired = nameCountToReqMap [("Pot",1),("Bucket",1),("Bucket of Milk",1), ("Egg", 1), ("Pot of flour", 1)]
                   ,reward = Reward {
                       questPointsReward = 1
                      ,skillPointsReward = M.fromList [(Cooking, 300)]
                      ,itemsReward = M.empty
                   }
                 }
