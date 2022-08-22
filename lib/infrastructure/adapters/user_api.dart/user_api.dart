import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:zemoga_test/domain/models/user.dart';
import 'package:zemoga_test/infrastructure/helpers/maps/mappers/user_mapper.dart';

import '../../../config/api_constants.dart';
import '../../../domain/models/gateway/user_gateway.dart';

class UserApi extends UserGateway {
  final UserMapper _commentMapper = UserMapper();

  @override
  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse(
        Apiconstants.baseUrl + Apiconstants.userEndpoint + userId.toString()));

    if (response.statusCode == 200) {
      return _commentMapper.fromMap(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception(' URL unavailable');
    }
  }
}
