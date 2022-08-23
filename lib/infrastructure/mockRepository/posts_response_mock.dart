import 'dart:convert';

import 'package:zemoga_test/domain/models/posts.dart';

String mockResponse = jsonEncode([
  {
    "userId": 1,
    "id": 1,
    "title":
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body":
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body":
        "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  },
  {
    "userId": 1,
    "id": 3,
    "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    "body":
        "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
  },
  {
    "userId": 1,
    "id": 4,
    "title": "eum et est occaecati",
    "body":
        "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
  },
]);

List<Posts> postsResponse = [];

String mockResponse2 =
    "[\r\n  {\r\n    \"userId\": 1,\r\n    \"id\": 1,\r\n    \"title\":\r\n        \"sunt aut facere repellat provident occaecati excepturi optio reprehenderit\",\r\n    \"body\":\r\n        \"quia et suscipit\\nsuscipit recusandae consequuntur expedita et cum\\nreprehenderit molestiae ut ut quas totam\\nnostrum rerum est autem sunt rem eveniet architecto\"\r\n  },\r\n  {\r\n    \"userId\": 1,\r\n    \"id\": 2,\r\n    \"title\": \"qui est esse\",\r\n    \"body\":\r\n        \"est rerum tempore vitae\\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\\nqui aperiam non debitis possimus qui neque nisi nulla\"\r\n  },\r\n  {\r\n    \"userId\": 1,\r\n    \"id\": 3,\r\n    \"title\": \"ea molestias quasi exercitationem repellat qui ipsa sit aut\",\r\n    \"body\":\r\n        \"et iusto sed quo iure\\nvoluptatem occaecati omnis eligendi aut ad\\nvoluptatem doloribus vel accusantium quis pariatur\\nmolestiae porro eius odio et labore et velit aut\"\r\n  },\r\n  {\r\n    \"userId\": 1,\r\n    \"id\": 4,\r\n    \"title\": \"eum et est occaecati\",\r\n    \"body\":\r\n        \"ullam et saepe reiciendis voluptatem adipisci\\nsit amet autem assumenda provident rerum culpa\\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\\nquis sunt voluptatem rerum illo velit\"\r\n  },\r\n]";
