FLUTTER_DEVICE = windows

run: build-go
	flutter run -d ${FLUTTER_DEVICE}

build: build-go
	flutter build -d ${FLUTTER_DEVICE}

build-go: 
	go build -buildmode=c-shared -o ./vendor-out/text.a ./vendor/text.go
