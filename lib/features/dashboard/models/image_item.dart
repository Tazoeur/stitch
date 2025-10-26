import 'package:file_selector/file_selector.dart';
import 'package:uuid/uuid.dart';

class ImageItem {
  final String id; // unique
  final XFile file;

  ImageItem(this.file) : id = const Uuid().v4();
}