import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../signals.dart';

/// Picks an image from the gallery, crops it to a square, compresses it,
/// and uploads it as the user's profile image.
///
/// Returns `true` if the image was successfully uploaded, `false` if the
/// user cancelled at any step (pick or crop).
/// Throws on compression or upload failure.
Future<bool> pickCropAndCompressImage(BuildContext context) async {
  // Capture UI settings before any async gap to avoid using BuildContext after await.
  final uiSettings = <PlatformUiSettings>[
    AndroidUiSettings(
      toolbarTitle: 'Crop Photo',
      toolbarColor: Colors.deepPurple,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.square,
      lockAspectRatio: true,
    ),
    IOSUiSettings(title: 'Crop Photo', aspectRatioLockEnabled: true),
    WebUiSettings(context: context),
  ];

  // 1. Pick the image
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return false; // User canceled picking

  // 2. Crop the image
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: image.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: uiSettings,
  );

  if (croppedFile == null) return false; // User canceled cropping

  // 3. Compress the image safely across platforms
  Uint8List? compressedBytes;

  if (kIsWeb) {
    compressedBytes = await FlutterImageCompress.compressWithList(await croppedFile.readAsBytes(), quality: 85);
  } else {
    compressedBytes = await FlutterImageCompress.compressWithFile(croppedFile.path, quality: 85);
  }

  if (compressedBytes == null) {
    throw Exception('Could not compress selected image');
  }

  // 4. Upload to Serverpod
  final byteData = compressedBytes.buffer.asByteData();
  await client.userProfile.setUserImage(byteData);
  return true;
}
