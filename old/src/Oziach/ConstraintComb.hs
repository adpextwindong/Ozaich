module Oziach.ConstraintComb () where

import Oziach.Types (Constraint)

--Experimental idea in combining constraints

--We should probably use a GADT to unify AND ANY OR  and lay out semmantics for thes combinators alongside regular constraints
--We will need a formalism for evaluating these eventually.

--NOTE: As this is a seperate type from Constraint its cumbersome to use.
--TODO reimplment Constraint with a GADT to allow for And 
data ConstraintComb = And Constraint Constraint
                    | Any [Constraint]
                    | Or Constraint Constraint --We should proably use ConstraintComb directly

--And as a combinator could be useful as a List of constraints could mean seperate goals to be done independantly.
--A single goal for something should refer to