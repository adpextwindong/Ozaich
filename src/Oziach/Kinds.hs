{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE GADTs #-}

--
-- This file is for ideas on using HList's or something to handle details related to Constraints at the type level.
-- VERY EXPERIMENTAL. NOT TO BE INTEGRATED WITH OTHER STUFF YET
--

module Oziach.Kinds where
import Oziach.Types

import Data.Typeable
import qualified GHC.Exts

data Boost = Boostable | Unboostable --To be used with skill

data ReqClarity = Explicit | Implicit --To be used with implicit constraints

data GameMode = Main | Ironman

type family GameMode' a where
    GameMode' Main = 'True
    GameMode' Ironman = 'True

type OrGameMode t = (GameMode' t ~ 'True) --ConstraintKind

newtype HkQuestConstraint (a :: GameMode) = HkConstraint Constraint

ts = HkConstraint (LevelConstraint Mining 50) :: HkQuestConstraint Main
tz = HkConstraint (LevelConstraint Farming 50) :: HkQuestConstraint Ironman

--TODO try out HList once we sort out the Cabal hell
--https://hackage.haskell.org/package/HList-0.5.0.0


--TODO find a reasonable way to use these types smoothly

--https://hengchu.github.io/posts/2018-05-09-type-lists-and-type-classes.lhs.html

hxs = HCons tz $ HCons ts HNil

data HList :: [*] -> * where
    HNil :: HList '[]
    HCons :: a -> HList t -> HList (a ': t)