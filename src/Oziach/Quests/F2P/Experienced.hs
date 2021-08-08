module Oziach.Quests.F2P.Experienced where

import Oziach.Types
    ( Quest(..),
      Membership(FreeToPlay),
      QClassification(Experienced),
      Skill(..),
      Reward(..))

import Oziach.Items ( nameCountToReqMap )

import qualified Data.Map as M
import qualified Data.Set as S

experiencedF2PQuests :: [Quest]
experiencedF2PQuests = [dragonSlayerI]

dragonSlayerI :: Quest
dragonSlayerI = Quest {
                    name = "Dragon Slayer I"
                   ,qt = FreeToPlay
                   ,classification = Experienced
                   ,levels = M.fromList [(Mining, 10)] --Boostable
                   ,parents = S.empty
                   ,questPoints = 0
                   ,itemsRequired = nameCountToReqMap [
                            ("Unfired bowl", 1)
                           ,("Wizard's mind bomb", 1)
                           ,("Lobster pot", 1)
                           ,("Silk", 1)
                           ,("Coins", 10000 + 2000) --TODO logical OR telegrab
                           ,("Hammer", 1)
                           ,("Anti-dragon shield", 1)
                           ,("Steel nails", 90)
                           ,("Plank", 3)]

                   ,reward = Reward {
                       questPointsReward = 1
                      ,skillPointsReward = M.fromList [(Smithing, 12725)]
                      ,itemsReward = M.fromList [(667, 1)] --Bluerite Sword
                   }
                 }

--TODO Design note: Quests like Dragon Slayer and MM allow for item requirement choice
--10k coins OR telegrab for DS1
--At this rate these quest requirements should be a semmantic combinator not a record

