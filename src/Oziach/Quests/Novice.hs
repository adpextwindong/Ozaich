module Oziach.Quests.Novice where

import Oziach.Types
import Oziach.Items ( nameCountToReqMap )

import qualified Data.Map as M
import qualified Data.Set as S

noviceQuests :: [Quest]
noviceQuests = [cooksAssistant]

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
