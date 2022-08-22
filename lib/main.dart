import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/view_model/favorites_view_model.dart';
import 'package:zemoga_test/view_model/home_view_model.dart';

import 'package:zemoga_test/view_model/posts_view_model.dart';
import 'config/utils/shared_preferences_util.dart';
import 'view/home.dart';

void main() async {
  final PostsData = PostsViewModel();
  PostsData.getPosts;
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => PostsViewModel()),
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Home(),
      ),
    );
  }
}
