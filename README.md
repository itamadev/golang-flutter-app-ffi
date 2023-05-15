# Golang Flutter App FFI

This repo demonstrates a very simple `Flutter` app with `Golang` used as backend lanugage, communicating using `FFI (Foreign Function Interface)`,
the app is a very simple note taking app that currently allows you to whip up a message and save it into a `message.txt` file.

## Example

![Example](docs/gifs/first_example.gif)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fitamadev%2Fgolang-flutter-app-ffi.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fitamadev%2Fgolang-flutter-app-ffi?ref=badge_shield)

## Prerequisites

- `go`
- `make`
- `flutter sdk` version `2.16.2^`

## Usage

Try it out:

```bash
$ make run

# Overrite FLUTTER_DEVICE to change the flutter device build option
# WARNNING: may not work with certain devices
$ make run FLUTTER_DEVICE=chrome
```

## Tested Devices

The following are the [Flutter Supported Devices](https://docs.flutter.dev/development/tools/sdk/release-notes/supported-platforms#supported-platforms)  

### Mobile

- [ ] android
- [ ] ios

### Desktop

- [x] windows
- [ ] linux

## Project Structure

- lib
  - main.dart
  - create_message.dart
- vendor
  - text.go
  - go.mod
- vendor/out (tmp)
  - text.a
  - text.h

`lib` - flutter code files

`create_message.dart` - Golang logic using FFI to Dart

`vendor` - Golang files as backend

`vendor/out` - Golang compiled files

## License

[MIT](LICENSE).


[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fitamadev%2Fgolang-flutter-app-ffi.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fitamadev%2Fgolang-flutter-app-ffi?ref=badge_large)