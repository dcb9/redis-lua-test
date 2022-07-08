.PHONY: test
test:
	rm -rf luacov.stats.out ; busted -c test-incr-and-stor.lua

.PHONY: coverage
coverage: test
	rm -rf luacov.report.out ; luacov '^incr' && cat luacov.report.out
