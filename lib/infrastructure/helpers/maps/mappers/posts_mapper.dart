import 'dart:convert';

import 'package:zemoga_test/domain/models/posts.dart';

import '../commons/mapper.dart';

class PostMapper extends Mapper<Posts> {
  @override
  fromMap(Map<String, dynamic> json) => Posts(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  // @override
  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   Posts post = Posts();
  //   data['userId'] = post.userId;
  //   data['id'] = post.id;
  //   data['title'] = post.title;
  //   data['body'] = post.body;
  //   return data;
  // }
}
