import 'package:flutter/Material.dart';

import '../config/style_constants.dart';
import '../config/use_case_config.dart';
import '../domain/models/user.dart';

class UserInfoWidget extends StatelessWidget {
  final style = StyleConstants();
  UserInfoWidget({
    Key? key,
    required UseCaseConfig postConfig,
    required this.id,
  })  : _postConfig = postConfig,
        super(key: key);

  final UseCaseConfig _postConfig;
  final int id;

  @override
  Widget build(BuildContext context) {
    var screenRatio = MediaQuery.of(context).devicePixelRatio;

    return Container(
      // color: Colors.amberAccent,
      height: screenRatio * 50,
      alignment: Alignment.centerLeft,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User', style: style.titles),
          FutureBuilder(
              future: _postConfig.getUserUseCase.getUser(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} ',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as User;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Text(
                            'Name: ' + data.name!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          //Email
                          Text(
                            'Email: ' + data.email!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          //Phone
                          Text(
                            'Phone: ' + data.phone!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          //Website
                          Text(
                            'Website: ' + data.website!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ]);
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
