import 'package:base_architecture/dart_core/global_functions/utils_global_function.dart';
import 'package:image_picker/image_picker.dart';

class FileManager {
  static final FileManager _instance = FileManager._();
  FileManager._();
  factory FileManager() => _instance;

  ImagePicker? _picker;

  Future<void> init() async {
    _picker = ImagePicker();
  }

  //pass ImageSource.camera to pick the image from the camera
  Future<void> pickVideo({ImageSource source = ImageSource.gallery}) async {
    assert(_picker != null,"make sure you have called init() method before calling the pickVideo()");
    try {
      final XFile? videoFile = await _picker!.pickVideo(source: source);
      if(videoFile == null){
        //no video selected
      }else {
        //chose what to do with picked video
      }
    }catch(e){
      printLog(e);
    }
  }

  Future<void> pickMultipleImages() async {
    assert(_picker != null,"make sure you have called init() method before calling the pickMultipleImages()");
    try {
      final List<XFile> pickedImages = await _picker!.pickMultiImage();
      if(pickedImages.isEmpty){
        //no image selected
      }else {
        //chose what to do with picked images
      }
    }catch(e){
      printLog(e);
    }
  }

  //pass ImageSource.camera to pick the image from the camera
  Future<void> pickSingleImage({ImageSource source = ImageSource.gallery}) async {
    assert(_picker != null,"make sure you have called init() method before calling the pickSingleImage()");
    try {
      final XFile? pickedImage = await _picker!.pickImage(source: source);
      if(pickedImage == null){
        //no image selected
      }else {
        //chose what to do with picked image
      }
    }catch(e){
      printLog(e);
    }
  }
}