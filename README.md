# euclidean rhythm

provides euclidean rhythms in various forms.

## usage:
```lua
er = require("euclideanrhythm")

er.beat_as_table(13,5)
-- {1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}

er.beat_as_boolean_table(13,5)
-- {true, false, false, true, false, true, false, false, true, false, true, false, false}

er.beat_as_string(13,5)
-- "1001010010100"
```
