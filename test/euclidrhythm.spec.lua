lu = require("luaunit")
er = require("euclidrhythm")

TestEuclidRhythm = {}

function TestEuclidRhythm:testInstantiationError()
  lu.assertError(er.new)
end

os.exit( lu.LuaUnit.run() )