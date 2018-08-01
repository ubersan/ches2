all: 
	ponyc ./src --output build --bin-name ches2

run:
	@./build/ches2