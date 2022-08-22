import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/domain/models/posts.dart';
import 'package:zemoga_test/view_model/favorites_view_model.dart';

import '../view_model/home_view_model.dart';

import '../view_model/posts_view_model.dart';

class FavoritesWidget extends StatelessWidget {
  bool isfavorite;
  int? index;
  int? postId;

  FavoritesWidget({Key? key, required this.isfavorite, this.index, this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postsProvider = Provider.of<PostsViewModel>(context, listen: true);
    var favoriteProvider =
        Provider.of<FavoritesViewModel>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (index != null && postId == null) {
          postsProvider.changeFavoriteStatus(index!, !isfavorite);
          postsProvider.sortPosts();
          !isfavorite == true
              ? favoriteProvider
                  .setFavoritesPost(postsProvider.postsList[index!])
              : favoriteProvider
                  .removeFromFavorites(postsProvider.postsList[index!].id!);
        } else if (postId != null) {
          postsProvider.changeFavoriteStatus(index!, !isfavorite);
          postsProvider.sortPosts();
          !isfavorite == true
              ? favoriteProvider
                  .setFavoritesPost(postsProvider.postsList[index!])
              : favoriteProvider.removeFromFavorites(postId!);
        }
      },
      child: isfavorite == false
          ? const Icon(
              Icons.star_border_outlined,
              color: Colors.amber,
            )
          : const Icon(
              Icons.star,
              color: Colors.amber,
            ),
    );
  }
}
