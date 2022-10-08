import 'dart:ffi' as ffi; // For FFI
import 'package:ffi/ffi.dart';

typedef CreateMessageFunctionTemplate = ffi.Pointer Function(
    ffi.Pointer<Utf8> message);

typedef CreateMessage = CreateMessageFunctionTemplate;

final dylib = ffi.DynamicLibrary.open('vendor/out/text.a');

final CreateMessage _createMessage = dylib
    .lookup<ffi.NativeFunction<CreateMessageFunctionTemplate>>('CreateMessage')
    .asFunction();

void createMessage(String text) {
  _createMessage(text.toNativeUtf8());
}
