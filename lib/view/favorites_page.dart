import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/posts.dart';
import '../view_model/favorites_view_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProviderList =
        Provider.of<FavoritesViewModel>(context, listen: true).favoritesList;

    return favoritesProviderList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Posts post = favoritesProviderList[index];
              return Card(
                child: ListTile(
                  title: Text(post.title!),
                ),
              );
            },
            separatorBuilder: (context, index) => Container(
              height: 10,
            ),
            itemCount: favoritesProviderList.length,
          )
        : const Center(child: Text("No data"));
  }
}
