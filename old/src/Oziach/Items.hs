module Oziach.Items where

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Bifunctor

--TODO find the cannonical itemid list
--TODO figure out a progamatic way to generate it instead of this bullshit
--TODO assert all id's aren't being reused. It might just be easier to have an sql db

--TODO parse the items-summary.json
--TODO assert that all the items in the quest file match the cannonicalItems

--TODO Design note: There's no cannonical Coin item except for the single coin.
--Coin stacks of different images have different id's.
--For now SINGLE COINS 995 will be cannonical
constCoin = 995

type Item = Int

grabCannonicalE :: String -> Item
grabCannonicalE s = cannonicalItems M.! s

nameCountToReqMap = M.fromList . fmap (first grabCannonicalE)

--TODO remove this and parse the json for it.
cannonicalItems :: M.Map String Item
cannonicalItems = M.fromList [("Pot",1931)
                            ,("Bucket",1925)
                            ,("Bucket of Milk",1927)
                            ,("Egg", 1944)
                            ,("Pot of flour", 1933)
                            ,("Redberry pie", 2325)
                            ,("Iron bar", 2351)
                            ,("Bronze pickaxe", 1265)
                            ,("Blurite ore", 668)

                            ,("Unfired bowl", 1791)
                            ,("Wizard's mind bomb", 1907)
                            ,("Lobster pot", 301)
                            ,("Silk", 950)
                            ,("Coins", constCoin)
                            ,("Hammer", 2347)
                            ,("Anti-dragon shield", 1540)
                            ,("Steel nails", 1539)
                            ,("Plank", 960)]