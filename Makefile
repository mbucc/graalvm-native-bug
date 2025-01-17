showbug: testapp
	@printf "\n\nThe testapp program should find a provider.\n"
	./testapp

testapp: mlib/com.example.service@1.jar mlib/com.example.provider@1.jar
	native-image \
		--module-path "mlib/com.example.service@1.jar:mlib/com.example.provider@1.jar" \
		--module com.example.service \
		--native-image-info \
		--verbose \
		--install-exit-handlers \
		testapp

.PHONY: nobug
nobug: mlib/com.example.service@1.jar mlib/com.example.provider@1.jar
	java -version 2>&1
	java -p mlib -m com.example.service

mlib/com.example.service@1.jar: compile
	mkdir -p mlib
	jar --create \
		--file=mlib/com.example.service@1.jar \
		--module-version 1 \
		--main-class com/example/service/Service \
		-C ./classes/com.example.service/ \
		.

mlib/com.example.provider@1.jar: compile
	mkdir -p mlib
	jar --create \
		--file=mlib/com.example.provider@1.jar \
		--module-version 1 \
		-C ./classes/com.example.provider/ \
		.

.PHONY: compile
compile:
	javac -d ./classes --module-source-path src $$(find src -name '*.java')

.PHONY: fmt
fmt:
	npx prettier --write "**/*.java"

.PHONY: clean
clean:
	rm -rf mlib
	rm -rf classes

