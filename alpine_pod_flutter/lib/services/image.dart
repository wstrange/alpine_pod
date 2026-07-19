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
    WebUiSettings(
      context: context,
      presentStyle: WebPresentStyle.page,
      size: const CropperSize(width: 520, height: 520),
      cropBoxMovable: true,
      cropBoxResizable: true,
      // zoomable: true,
      viewwMode: WebViewMode.mode_1,
      customDialogBuilder: (cropper, initCropper, crop, rotate, scale) {
        return WebCropperDialog(
          cropper: cropper,
          initCropper: initCropper,
          crop: crop,
          rotate: rotate,
          scale: scale,
        );
      },

      // customDialogBuilder:
    ),
  ];

  // 1. Pick the image
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return false; // User canceled picking

  // 2. Crop the image
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: image.path,

    // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: uiSettings,
  );

  if (croppedFile == null) return false; // User canceled cropping

  // 3. Compress the image safely across platforms
  Uint8List? compressedBytes;

  if (kIsWeb) {
    compressedBytes = await FlutterImageCompress.compressWithList(
      await croppedFile.readAsBytes(),
      quality: 85,
    );
  } else {
    compressedBytes = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      quality: 85,
    );
  }

  if (compressedBytes == null) {
    throw Exception('Could not compress selected image');
  }

  // 4. Upload to Serverpod
  final byteData = compressedBytes.buffer.asByteData();
  await client.userProfile.setUserImage(byteData);
  return true;
}

class WebCropperDialog extends StatefulWidget {
  final Widget cropper;
  final void Function() initCropper;
  final Future<String?> Function() crop;
  final void Function(RotationAngle) rotate;
  final void Function(int) scale;

  const WebCropperDialog({
    super.key,
    required this.cropper,
    required this.initCropper,
    required this.crop,
    required this.rotate,
    required this.scale,
  });

  @override
  State<WebCropperDialog> createState() => _WebCropperDialogState();
}

class _WebCropperDialogState extends State<WebCropperDialog> {
  @override
  void initState() {
    super.initState();
    // CRITICAL: Tells the JavaScript engine to bind pointer/mouse
    // events to the canvas container immediately upon layout mounting.
    widget.initCropper();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 550,
        height: 600,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Adjust Crop Area",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Contains the raw HTML Cropper layer safely wrapped inside Flutter
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: widget.cropper,
              ),
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    // Executes the CropperJS export process and fetches the temp file path
                    final resultPath = await widget.crop();
                    if (context.mounted) {
                      Navigator.of(context).pop(resultPath);
                    }
                  },
                  child: const Text("Apply Crop"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
