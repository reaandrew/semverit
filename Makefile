.PHONY: test
test: shunit2-2.1.7/ shellcheck-v0.5.0/
	./shellcheck-v0.5.0/shellcheck -x semverit_lib
	./semverit_test

.PHONY: test_osx
test_osx: shunit2-2.1.7/ shell_check_osx
	shellcheck -x semverit_lib
	./semverit_test

shunit2-2.1.7/:
	curl -s -L "https://github.com/kward/shunit2/archive/v2.1.7.tar.gz" | tar zx

shellcheck-v0.5.0/:
	curl -s -L -o /tmp/shellcheck-v0.5.0.linux.x86_64.tar.xz https://storage.googleapis.com/shellcheck/shellcheck-v0.5.0.linux.x86_64.tar.xz
	tar -xJf /tmp/shellcheck-v0.5.0.linux.x86_64.tar.xz -C ./

.PHONY: shell_check_osx
shell_check_osx:
	brew install shellcheck


.PHONY: dist
dist:
	mkdir -p dist
	cp semverit_lib dist/semverit
	echo 'getNextVersion "$$1"' >> dist/semverit
	chmod +x dist/semverit
