import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

final ImagePicker _picker = ImagePicker();

Future<XFile?> pickImage() async {
  final XFile? image = await _picker.pickImage(
    source: ImageSource.gallery, // or ImageSource.camera
    imageQuality: 85, // Compresses file size upfront
  );
  return image;
}

Future<CroppedFile?> cropImage(String imagePath) async {
  return await ImageCropper().cropImage(
    sourcePath: imagePath,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Profile Picture',
        toolbarColor: Colors.deepPurple,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      IOSUiSettings(title: 'Crop Profile Picture'),
    ],
  );
}

// Future<File?> compressImage(String filePath, String targetPath) async {
//   var result = await FlutterImageCompress.compressAndGetFile(
//     filePath,
//     targetPath,
//     quality: 70,
//     format: CompressFormat.jpeg,
//   );
//   return result != null ? File(result.path) : null;
// }

Future<Uint8List?> compressImageCrossPlatform(XFile pickedFile) async {
  if (kIsWeb) {
    // Web Strategy: Read bytes from the browser's blob reference directly
    final Uint8List webBytes = await pickedFile.readAsBytes();

    return await FlutterImageCompress.compressWithList(webBytes, quality: 70, format: CompressFormat.jpeg);
  } else {
    // Mobile/Desktop Strategy: Compress directly using file path strings
    return await FlutterImageCompress.compressWithFile(pickedFile.path, quality: 70, format: CompressFormat.jpeg);
  }
}

Future<void> uploadBytesToServerpod(Client client, Uint8List compressedBytes) async {
  ByteData byteData = compressedBytes.buffer.asByteData();
  await client.userProfile.setUserImage(byteData);
}
