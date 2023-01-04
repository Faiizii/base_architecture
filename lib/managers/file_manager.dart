
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class FileManager {
  final Logger _log = Logger("FileManager");

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
      _log.log(Level.SEVERE,e);
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
      _log.log(Level.SEVERE,e);
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
      _log.log(Level.SEVERE,e);
    }
  }
}