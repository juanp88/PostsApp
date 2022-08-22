import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/config/style_constants.dart';
import 'package:zemoga_test/domain/models/comments.dart';
import 'package:zemoga_test/domain/models/user.dart';
import 'package:zemoga_test/view_model/posts_view_model.dart';
import 'package:zemoga_test/widgets/favorites_widget.dart';

import '../config/use_case_config.dart';
import '../view_model/favorites_view_model.dart';
import '../widgets/user_info_widget.dart';

class PostDetail extends StatelessWidget {
  final String description;
  final int id;
  final int userId;
  final bool isFavorite;
  final int postIndex;
  PostDetail(
      {Key? key,
      required this.description,
      required this.id,
      required this.userId,
      required this.isFavorite,
      required this.postIndex})
      : super(key: key);

  var style = StyleConstants();

  @override
  Widget build(BuildContext context) {
    var screenRatio = MediaQuery.of(context).devicePixelRatio;
    // ignore: unused_local_variable
    final postProvider = Provider.of<PostsViewModel>(context, listen: true);

    final UseCaseConfig _postConfig = UseCaseConfig();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (postProvider.postsList[postIndex].favorite! == true) {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        content: const Text(
                            "Favorite post can't be deleted, first remove favorite selection"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      ));
            } else {
              postProvider.deletePost(id);
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.delete)),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Text('Post id:' + id.toString()),
            GestureDetector(
              child: FavoritesWidget(
                  isfavorite: postProvider.postsList[postIndex].favorite!,
                  postId: id,
                  index: postIndex),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //description
          Flexible(
            child: Row(
              children: [
                Expanded(
                  //color: Colors.amber,
                  child: SizedBox(
                    height: screenRatio * 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description', style: style.titles),
                        // const SizedBox(height: 10),
                        Text(
                          description,
                          style: style.texts,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //User info
          UserInfoWidget(postConfig: _postConfig, id: userId),
          //comments title
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Comments',
                style: style.titles,
              )),
          SizedBox(height: screenRatio * 5),
          //commments
          Flexible(
            child: Row(
              children: [
                Expanded(flex: 5, child: commentsBuilder(_postConfig)),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  FutureBuilder<List<Comment>> commentsBuilder(UseCaseConfig _postConfig) {
    return FutureBuilder(
        future: _postConfig.getCommentsUseCase.getComments(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: style.titles,
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data as List<Comment>;
              return ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                separatorBuilder: (context, index) => Divider(
                  color: Theme.of(context).primaryColor,
                ),
                itemBuilder: ((context, index) {
                  Comment comment = data[index];
                  return ListTile(
                    title: Text(
                      comment.body.toString(),
                      style: style.texts,
                    ),
                  );
                }),
              );
            }
          }
          return const Center(
            child: Text('No hay datos disponibles'),
          );
        });
  }
}
