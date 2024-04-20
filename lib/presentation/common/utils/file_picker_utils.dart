import 'dart:io';

import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// Common file pickers for projects

class FilePickerUtils {
  static Future<File?> pickImage({
    required ImageSource imageSource,
    int? imageQuality,
    bool isCrop = false,
  }) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: imageQuality,
    );
    if (pickedFile == null) return null;
    if (isCrop) {
      return cropImage(pickedFile.path);
    } else {
      return File(pickedFile.path);
    }
  }

  static Future<File?> cropImage(String filePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: StringConstants.appName,
          toolbarColor: Get.context!.theme.primaryColor,
          toolbarWidgetColor: AppColors.whiteColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: StringConstants.appName,
        ),
      ],
    );
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }
}
