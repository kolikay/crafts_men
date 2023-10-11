import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    XFile? _file = await imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
  }
}
