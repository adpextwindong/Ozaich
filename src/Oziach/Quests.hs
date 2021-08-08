module Oziach.Quests
  ( quests,
    module Oziach.Quests.Novice)
 where

import Oziach.Types ( Quest )
import Oziach.Quests.Novice
import Oziach.Items

import qualified Data.Map as M
import qualified Data.Set as S
--TODO test with hspec, DEEPSEQ all quests to make sure the items don't blowup

intermediateQuests = [] --TODO
experiencedQuests = [] --TODO
masterQuests = [] --TODO
grandmasterQuests = [] --TODO
specialQuests = [] --TODO 

quests :: [Quest]
quests = concat [noviceQuests, intermediateQuests, experiencedQuests, masterQuests, specialQuests]