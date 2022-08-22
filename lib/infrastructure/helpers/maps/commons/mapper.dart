import 'package:zemoga_test/domain/models/posts.dart';

abstract class Mapper<i> {
  fromMap(Map<String, dynamic> json) {
    return i;
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
