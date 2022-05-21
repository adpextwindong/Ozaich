module Oziach.Quests
  ( quests,
    module Oziach.Quests.F2P.Novice)
 where

import Oziach.Types ( Quest )
import Oziach.Quests.F2P.Novice ( noviceF2PQuests )
import Oziach.Quests.F2P.Intermediate ( intermediateF2PQuests )
import Oziach.Quests.F2P.Experienced ( experiencedF2PQuests )
import Oziach.Items

import qualified Data.Map as M
import qualified Data.Set as S
--TODO test with hspec, DEEPSEQ all quests to make sure the items don't blowup

noviceQuests = noviceF2PQuests ++ noviceP2PQuests

noviceP2PQuests = []
intermediateQuests = intermediateF2PQuests --TODO
experiencedQuests = experiencedF2PQuests --TODO
masterQuests = [] --TODO
grandmasterQuests = [] --TODO
specialQuests = [] --TODO 

quests :: [Quest]
quests = concat [noviceQuests, intermediateQuests, experiencedQuests, masterQuests, specialQuests]