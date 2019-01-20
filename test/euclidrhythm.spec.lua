lu = require("luaunit")
er = require("euclidrhythm")

TestEuclidRhythm = {}

function TestEuclidRhythm:testInstantiationError()
  lu.assertError(er.new)
end

function TestEuclidRhythm:testBeatsSequenceLengthError()
  lu.assertError(er.beat_as_table, 3, 5)
end

function TestEuclidRhythm:testSimpleBeatConstructionAsTable()
  local result = er.beat_as_table(4,2)
  local expected = {1, 0, 1, 0}
  lu.assertEquals(result, expected)
end

function TestEuclidRhythm:testComplexBeatConstructionAsTable()
  local result = er.beat_as_table(13,5)
  local expected = {1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}
  lu.assertEquals(result, expected)
end

function TestEuclidRhythm:testEdgeCaseOnlyBeatsAsTable()
  local result = er.beat_as_table(4,4)
  local expected = {1, 1, 1, 1}
  lu.assertEquals(result, expected)
end

function TestEuclidRhythm:testEdgeNoBeatsAsTable()
  local result = er.beat_as_table(4,0)
  local expected = {0, 0, 0, 0}
  lu.assertEquals(result, expected)
end

os.exit( lu.LuaUnit.run() )