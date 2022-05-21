# Quest Step Ordering Example

[Glocks HCIM Guide](https://pastebin.com/9QQCPca1) early on suggests doing [The Restless Ghost](https://oldschool.runescape.wiki/w/The_Restless_Ghost/Quick_guide) and [Rune Mysteries](https://oldschool.runescape.wiki/w/Rune_Mysteries/Quick_guide) in parallel.


The Restless Ghost Quickguide:

```
Getting started

- Talk to Father Aereck in the Lumbridge church. (Lumbridge teleport can be used for quick travel to Lumbridge) (Chat 3•1)
- Go through the graveyard's southern exit and head to the hut west of Lumbridge Swamp.

Ghostspeak amulet

- Talk to Father Urhney inside the hut. (Chat 2•1)
- Head to the Lumbridge graveyard south of the church.
- Equip the Ghostspeak amulet and click the coffin, talk to the ghost. (Chat 1)

The skull

- Head to the Wizards' Tower, and climb down the ladder to the basement. (Use Necklace of passage to teleport to Wizards' Tower if you have one.)
- Search the altar, and you will receive a ghost's skull. A level 13 skeleton will appear, you don't have to kill it, just leave.
- Go back to the graveyard and use the skull on the coffin with it open.
```

Rune Mysteries

```
- Ask Duke Horacio for a quest and he'll give you an air talisman. (Chat 2•1•1)
- Optionally: Drop trick the talisman for any amount of time. See this guide for more info.
- Talk to wizard Sedridor in the Wizards' Tower basement and give him the air talisman. (Chat 3•1•1)
- Talk to Aubury south of Varrock East Bank in the Varrock rune shop. (Chat 3)
- Talk to Aubury again.
- Take the notes back to Sedridor.
```

In the simplest form (ignoring the teleportation amulet) we would want this form of ordering:

```
- Ask Duke Horacio for a quest and he'll give you an air talisman. (Chat 2•1•1)
- Talk to Father Aereck in the Lumbridge church. (Lumbridge teleport can be used for quick travel to Lumbridge) (Chat 3•1)
- Go through the graveyard's southern exit and head to the hut west of Lumbridge Swamp.
- Talk to Father Urhney inside the hut. (Chat 2•1)
- Head to the Lumbridge graveyard south of the church.
- Equip the Ghostspeak amulet and click the coffin, talk to the ghost. (Chat 1)
- Head to the Wizards' Tower, and climb down the ladder to the basement. (Use Necklace of passage to teleport to Wizards' Tower if you have one.)
- Search the altar, and you will receive a ghost's skull. A level 13 skeleton will appear, you don't have to kill it, just leave.
- Talk to wizard Sedridor in the Wizards' Tower basement and give him the air talisman. (Chat 3•1•1)
- Go back to the graveyard and use the skull on the coffin with it open.
- Talk to Aubury south of Varrock East Bank in the Varrock rune shop. (Chat 3)
- Talk to Aubury again.
- Take the notes back to Sedridor.
```

Idealy we could calculate the distance between tasks to minimize backtracking.

We need to ensure any "Talk/Ask" constructors in the DSL have a list of chat options. (Although this might have to be ad-hoc/flexible enough to handle the more intricate quests).

Additionally partial completion of Rune Mysteries unlocks a source of air talismans temporarily. For now we can ignore this but it could be a neat planning idea later on.
