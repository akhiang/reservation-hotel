import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File> imgFromCamera() async {
  var pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  return File(pickedFile.path);
}

Future<File> imgFromGallery() async {
  var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(pickedFile.path);
}
