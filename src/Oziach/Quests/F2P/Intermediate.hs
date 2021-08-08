module Oziach.Quests.F2P.Intermediate where

import Oziach.Types
    ( Quest(..),
      Membership(FreeToPlay),
      QClassification(Intermediate),
      Skill(..),
      Reward(..))

import Oziach.Items ( nameCountToReqMap )

import qualified Data.Map as M
import qualified Data.Set as S

intermediateF2PQuests :: [Quest]
intermediateF2PQuests = [theKnightsSword]

theKnightsSword :: Quest
theKnightsSword = Quest {
                    name = "The Knight's Sword"
                   ,qt = FreeToPlay
                   ,classification = Intermediate
                   ,levels = M.fromList [(Mining, 10)] --Boostable
                   ,parents = S.empty
                   ,questPoints = 0
                   ,itemsRequired = nameCountToReqMap [
                            ("Redberry pie", 1)
                            ,("Iron bar", 2)
                            ,("Bronze pickaxe", 1)
                            ,("Blurite ore", 1)]

                   ,reward = Reward {
                       questPointsReward = 1
                      ,skillPointsReward = M.fromList [(Smithing, 12725)]
                      ,itemsReward = M.fromList [(667, 1)] --Blurite Sword
                      --TODO this itemsReward handling on the wiki facing side is hard to use. Make it use names.
                   }
                 }

--TODO Design note: Knight's sword requires "ANY" pickaxe...
--TODO Design note: Knight's sword has an implicit 10 cooking requirement for Ironmen.
--TODO Design note: Should we explicitly have "Ability to do X" rewards? Thats for way down the line for nonQuest planning.