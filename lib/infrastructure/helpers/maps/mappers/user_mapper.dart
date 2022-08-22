import '../../../../domain/models/user.dart';
import '../commons/mapper.dart';

class UserMapper extends Mapper<User> {
  @override
  fromMap(Map<String, dynamic> json) => User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website']);
}
