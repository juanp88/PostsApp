import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/view/post_detail.dart';
import 'package:zemoga_test/view_model/posts_view_model.dart';
import 'package:zemoga_test/widgets/favorites_widget.dart';

import '../domain/models/posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsViewModel>(context, listen: true);

    return Scaffold(
      //Delete Button
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            postsProvider.clearPosts();
          },
          child: const Icon(Icons.delete)),
      body: (postsProvider.postsList.isEmpty &&
              postsProvider.activeConnection == false)
          ? const Center(
              child: Text('No data available, check your internet connection'))
          : (postsProvider.activeConnection == true &&
                  postsProvider.postsList.isEmpty)
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Posts post = postsProvider.postsList[index];

                    return Card(
                      child: ListTile(
                        leading: FavoritesWidget(
                            isfavorite: post.favorite!, index: index),
                        title: GestureDetector(
                          child: Text(post.title!),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostDetail(
                                        id: post.id!,
                                        userId: post.userId!,
                                        description: post.body!,
                                        postIndex: index,
                                        isFavorite: post.favorite!,
                                      )),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(
                    height: 5,
                  ),
                  itemCount: postsProvider.postsList.length,
                ),
    );
  }
}
