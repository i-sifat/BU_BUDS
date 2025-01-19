// lib/services/image_generator_service.dart
import 'dart:io';
import 'dart:ui' as ui;
import 'package:bubuds/services/storage_permission_service.dart';
import 'package:flutter/rendering.dart';

class ImageGeneratorService {
  static Future<String?> captureAndSaveImage(
      RenderRepaintBoundary boundary) async {
    try {
      // Request storage permission
      final hasPermission =
          await StoragePermissionService.requestStoragePermission();
      if (!hasPermission) {
        throw Exception('Storage permission denied');
      }

      // Capture the image
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        // Get the downloads directory
        final downloadsDir = Directory('/storage/emulated/0/Download');
        if (!await downloadsDir.exists()) {
          await downloadsDir.create(recursive: true);
        }

        final fileName = 'routine_${DateTime.now().millisecondsSinceEpoch}.png';
        final imagePath = '${downloadsDir.path}/$fileName';
        final imageFile = File(imagePath);

        // Write the file
        await imageFile.writeAsBytes(byteData.buffer.asUint8List());
        return imagePath;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
