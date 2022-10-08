import 'dart:ffi' as ffi; // For FFI
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

typedef CreateMessageFunctionTemplate = ffi.Pointer Function(
    ffi.Pointer<Utf8> message);

typedef CreateMessage = CreateMessageFunctionTemplate;

// Future<String> vendorFuture =
//     copyAssetToLocal().then((value) => vendorPath = value);

// final dylib = ffi.DynamicLibrary.open('vendor/out/text.a');

void createMessage(String text) async {
  String path = await copyAssetToLocal();
  final dylib = ffi.DynamicLibrary.open(path);

  final CreateMessage _createMessage = dylib
      .lookup<ffi.NativeFunction<CreateMessageFunctionTemplate>>(
          'CreateMessage')
      .asFunction();
  print("log :: writing using $path");
  _createMessage(text.toNativeUtf8());
}

Future<String> copyAssetToLocal() async {
  try {
    var content = await rootBundle.load("vendor/out/text.a");
    final directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/text.a");
    file.writeAsBytesSync(content.buffer.asUint8List());
    return file.path;
  } catch (e) {
    rethrow;
  }
}
