import 'package:zemoga_test/domain/models/gateway/user_gateway.dart';

import '../../models/user.dart';

class GetUserUseCase {
  final UserGateway _userGateway;
  GetUserUseCase(this._userGateway);

  Future<User> getUser(int userId) async {
    return _userGateway.getUser(userId);
  }
}
