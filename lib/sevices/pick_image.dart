import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:translator/models/image.dart';

class Capture {
  File image;
  final picker = ImagePicker();

  Future<CapturedImage> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      return CapturedImage.fromFile(image);
    } else {
      return CapturedImage.fromError('Please try again');
    }
  }
}
