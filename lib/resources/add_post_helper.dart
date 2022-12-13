import 'dart:typed_data';

class AddpostHelper {
  static List<Uint8List> _list = [];

  List<Uint8List?> getter() {
    return _list;
  }

  static void set(Uint8List image) {
    _list.add(image);
  }

  List<Uint8List> getNotnull() {
    List<Uint8List> temp = _list;
    return temp;
  }

  static void reset() {
    _list = [];
  }

  static void deleteImage(Uint8List value) {
    if (_list != null) {
      _list.indexOf(value);
      _list.remove(value);
    }
  }

  static void printlist() {
    print(_list.length);
  }
}
