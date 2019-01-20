# euclidean rhythm

Provides [euclidean rhythms](https://en.wikipedia.org/wiki/Euclidean_rhythm) in various forms.

## Usage:

Currently the library can generate rhythms in three formats: table, boolean table, and string. The first parameter is the sequence length, the second parameter the number of beats in the sequence.

Import the module:
```lua
er = require("euclideanrhythm")
```

This generates a sequence of length 13 with 5 beats in it.
```lua
er.beat_as_table(13,5)
-- {1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}

er.beat_as_boolean_table(13,5)
-- {true, false, false, true, false, true, false, false, true, false, true, false, false}

er.beat_as_string(13,5)
-- "1001010010100"
```
