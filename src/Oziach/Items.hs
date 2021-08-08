module Oziach.Items where

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Bifunctor

--TODO find the cannonical itemid list
--TODO figure out a progamatic way to generate it instead of this bullshit
--TODO assert all id's aren't being reused. It might just be easier to have an sql db

--TODO parse the items-summary.json
--TODO assert that all the items in the quest file match the cannonicalItems

type Item = Int

grabCannonicalE :: String -> Item
grabCannonicalE s = cannonicalItems M.! s

nameCountToReqMap = M.fromList . fmap (first grabCannonicalE)

cannonicalItems :: M.Map String Item
cannonicalItems = M.fromList [("Pot",1931),
                            ("Bucket",1925),
                            ("Bucket of Milk",1927),
                            ("Egg", 1944),
                            ("Pot of flour", 1933)]