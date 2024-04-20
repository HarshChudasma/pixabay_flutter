import 'dart:developer';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

/// Image compressor utils

class ImageCompressorUtil {
  static Future<File> compressFile(
      File file, {
        int quality = 95,
        int minWidth = 1920,
        int minHeight = 1080,
      }) async {
    try {
      final filePath = file.absolute.path;
      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, (lastIndex));
      final outPath = '${splitted}_out${filePath.substring(lastIndex)}';

      final XFile? compressedImage =
      await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        quality: quality,
        minWidth: minWidth,
        minHeight: minHeight,
      );
      log(':::::::::original file size:  ${file.readAsBytesSync().length / 1000}');
      log(
        compressedImage == null
            ? ':::::::::Failed to compress image'
            : ':::::::::file size:  ${File(compressedImage.path).readAsBytesSync().lengthInBytes / 1000}',
      );
      if (compressedImage == null) {
        return file;
      }

      return File(compressedImage.path);
    } catch (e) {
      return file;
    }
  }
}
