# ![image](https://user-images.githubusercontent.com/3671250/128638119-4cf3fe26-8c21-418c-9813-a49e43cfc0c5.png) Oziach

A repo for exploration into OSRS quest planning.

## Example output for now

```haskell
print $ genConstraints cooksAssistant
```

```
fromList [ItemConstraint 1925 1,ItemConstraint 1927 1,ItemConstraint 1931 1,ItemConstraint 1933 1,ItemConstraint 1944 1]
```
## Open Design Issues

- Modeling constraints for a planning library
- Handling implicit and explicit requirements/constraints.
- Handling boostable/unboostable constraints
- Handling "Obtainable during quest" and "Recommended items/levels"
- Handling ironmen constraints
