import 'package:zemoga_test/domain/models/comments.dart';

import '../commons/mapper.dart';

class CommentMapper extends Mapper<Comment> {
  @override
  fromMap(Map<String, dynamic> json) => Comment(
        body: json['body'],
      );
}
