FLUTTER_DEVICE = windows

run: build-go flutter-config-devices
	flutter run -d ${FLUTTER_DEVICE}

build: build-go flutter-config-devices
	flutter build -d ${FLUTTER_DEVICE}

clean:
	flutter clean

flutter-config-devices:
	flutter config --enable-linux-desktop

build-go: 
	go build -buildmode=c-shared -o ./vendor/out/text.a ./vendor/text.go
