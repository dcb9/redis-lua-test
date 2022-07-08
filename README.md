# redis-lua-test

Unit testing environment for Redis Lua Scripts. It is inspired by [Unit Testing Redis Lua Scripts -- Andrew Newdigate](https://blog.gitter.im/2015/01/13/testing-redis-lua-scripts/).

In my case installing and setuping all debugging tools and unit test tools properly on my laptop is very challenging, so docker is my best friend to do these things.

## Usage

### Step0. Install docker by your own

### Step1. Clone code

~~~bash
$ git clone https://github.com/dcb9/redis-lua-test.git
$ cd redis-lua-test
~~~

### Step2. Start redis

~~~bash
$ docker compose up redis -d
~~~

### Step3. Run test code

~~~bash
$ docker compose up lua
~~~

	[+] Running 1/0
	⠿ Container redis-lua-test-lua-1 Created            0.0s
	Attaching to redis-lua-test-lua-1
	redis-lua-test-lua-1  | rm -rf luacov.stats.out ; busted -c test-incr-and-stor.lua
	redis-lua-test-lua-1  | ++
	redis-lua-test-lua-1  | 2 successes / 0 failures / 0 errors / 0 pending : 0.053681 seconds
	redis-lua-test-lua-1  | rm -rf luacov.report.out ; luacov '^incr' && cat luacov.report.out
	redis-lua-test-lua-1  | ===================================================================
	redis-lua-test-lua-1  | incr-and-stor.lua
	redis-lua-test-lua-1  | ===================================================================
	redis-lua-test-lua-1  |  3 local link_id = redis.call("INCR", KEYS[1])
	redis-lua-test-lua-1  |  3 redis.call("HSET", KEYS[2], link_id, ARGV[1])
	redis-lua-test-lua-1  |  3 return link_id
	redis-lua-test-lua-1  |
	redis-lua-test-lua-1  | ===================================================================
	redis-lua-test-lua-1  | Summary
	redis-lua-test-lua-1  | ===================================================================
	redis-lua-test-lua-1  |
	redis-lua-test-lua-1  | File              Hits Missed Coverage
	redis-lua-test-lua-1  | --------------------------------------
	redis-lua-test-lua-1  | incr-and-stor.lua 3    0      100.00%
	redis-lua-test-lua-1  | --------------------------------------
	redis-lua-test-lua-1  | Total             3    0      100.00%
	redis-lua-test-lua-1 exited with code 0
