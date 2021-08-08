module Oziach.Quests where

import Oziach.Types
import Oziach.Items

import qualified Data.Map as M
import qualified Data.Set as S
--TODO test with hspec, DEEPSEQ all quests to make sure the items don't blowup

quests = [cooksAssistant]

novice_quests = [cooksAssistant]

cooksAssistant = Quest {
                    name = "Cook's Assistant"
                   ,levels = M.fromList []
                   ,parents = S.fromList []
                   ,questPoints = 0
                   ,itemsRequired = nameCountToReqMap [("Pot",1),("Bucket",1),("Bucket of Milk",1), ("Egg", 1), ("Pot of flour", 1)]
                 }