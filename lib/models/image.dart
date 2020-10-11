import 'dart:io';

class CapturedImage {
  final File image;
  final String error;

  CapturedImage(this.image, this.error);

  CapturedImage.fromFile(File file)
      : image = file,
        error = '';

  CapturedImage.fromError(String error)
      : image = File(''),
        error = error;
}
