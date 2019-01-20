lu = require("luaunit")
er = require("euclideanrhythm")

TestEuclideanRhythm = {}

function TestEuclideanRhythm:testInstantiationError()
  lu.assertError(er.new)
end

function TestEuclideanRhythm:testBeatsSequenceLengthError()
  lu.assertError(er.beat_as_table, 3, 5)
end

function TestEuclideanRhythm:testSimpleBeatConstructionAsTable()
  local result = er.beat_as_table(4,2)
  local expected = {1, 0, 1, 0}
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testComplexBeatConstructionAsTable()
  local result = er.beat_as_table(13,5)
  local expected = {1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testEdgeCaseOnlyBeatsAsTable()
  local result = er.beat_as_table(4,4)
  local expected = {1, 1, 1, 1}
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testEdgeCaseNoBeatsAsTable()
  local result = er.beat_as_table(4,0)
  local expected = {0, 0, 0, 0}
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testEdgeCaseSingleBeatAsTable()
  local result = er.beat_as_table(1,1)
  local expected = {1}
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testEdgeCaseLongAsTable()
  local result = er.beat_as_table(109,107)
  local expected = { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testEdgeCaseLongAndComplexAsTable()
  local result = er.beat_as_table(60, 41)
  local expected = { 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1 }
  lu.assertEquals(result, expected)
end

function TestEuclideanRhythm:testBeatAsString()
  local result = er.beat_as_string(13,5)
  local expected = "1001010010100"
  lu.assertEquals(result, expected)
end

os.exit( lu.LuaUnit.run() )