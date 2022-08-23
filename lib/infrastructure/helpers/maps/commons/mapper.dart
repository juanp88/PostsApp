abstract class Mapper<i> {
  fromMap(Map<String, dynamic> json) {
    return i;
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
