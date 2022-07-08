local call_redis_script = require "./harness";

describe("incr-and-stor", function()

  -- Flush the database before running the tests
  before_each(function()
    redis.call('FLUSHDB')
  end)

  it("should add single items", function()
    -- Call the incr-and-stor.lua script with the given keys and values
    local result = call_redis_script('incr-and-stor.lua',  { "counter", "hash" }, { "link1" });
    assert.are.equals(1, result)

    local hash = redis.call("HGETALL", "hash")
    assert.are.same({ ["1"] = "link1" }, hash)
  end)


  it("should add multiple items", function()
    -- Call the incr-and-stor.lua script with the given keys and values
    local result = call_redis_script('incr-and-stor.lua',  { "counter", "hash" }, { "link1" });
    assert.are.equals(1, result)

    result = call_redis_script('incr-and-stor.lua',  { "counter", "hash" }, { "link2" });
    assert.are.equals(2, result)

    local hash = redis.call("HGETALL", "hash")
    assert.are.same({ ["1"] = "link1", ["2"] = "link2" }, hash)
  end)
end)
