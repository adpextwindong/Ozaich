# ![image](https://user-images.githubusercontent.com/3671250/128638119-4cf3fe26-8c21-418c-9813-a49e43cfc0c5.png) Oziach

A repo for exploration into OSRS quest planning.

## Example output for now

```haskell
print $ genConstraints cooksAssistant
```

```haskell
fromList [ItemConstraint 1925 1,ItemConstraint 1927 1,ItemConstraint 1931 1,ItemConstraint 1933 1,ItemConstraint 1944 1]
```

```haskell
import qualified Data.Set as S
print $ S.unions $ genConstraints <$> quests
```

```haskell
fromList [LevelConstraint Mining 10,ItemConstraint 301 1,ItemConstraint 668 1,ItemConstraint 950 1,ItemConstraint 960 3,ItemConstraint 995 12000,ItemConstraint 1265 1,ItemConstraint 1539 90,ItemConstraint 1540 1,ItemConstraint 1791 1,ItemConstraint 1907 1,ItemConstraint 1925 1,ItemConstraint 1927 1,ItemConstraint 1931 1,ItemConstraint 1933 1,ItemConstraint 1944 1,ItemConstraint 2325 1,ItemConstraint 2347 1,ItemConstraint 2351 2]
```

## Open Design Issues

- Modeling constraints for a planning library
- Handling implicit and explicit requirements/constraints.
- Handling boostable/unboostable constraints
- Handling "Obtainable during quest" and "Recommended items/levels"
- Handling ironmen constraints
