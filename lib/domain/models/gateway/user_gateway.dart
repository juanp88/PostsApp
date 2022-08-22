import 'package:zemoga_test/domain/models/user.dart';

abstract class UserGateway {
  Future<User> getUser(int userId);
}
