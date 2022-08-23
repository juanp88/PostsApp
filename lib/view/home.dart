import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/view/favorites_page.dart';
import 'package:zemoga_test/view/posts_page.dart';

import 'package:zemoga_test/view_model/home_view_model.dart';
import 'package:zemoga_test/view_model/posts_view_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);
    final postsProvider = Provider.of<PostsViewModel>(context, listen: true);

    final screens = [const PostsPage(), const FavoritesPage()];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.greenAccent,
        title: ListTile(
          title: const Text('Posts'),
          //reload button
          trailing: IconButton(
            onPressed: () {
              postsProvider.clearPosts();
              postsProvider.getPosts();
            },
            icon: const Icon(Icons.replay_circle_filled_rounded),
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeProvider.currentIndex,
          onTap: (index) => {homeProvider.setcurrenIndex(index)},
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: 'Posts'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
      body: IndexedStack(
        index: homeProvider.currentIndex,
        children: screens,
      ),
    );
  }
}
