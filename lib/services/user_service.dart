import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/models/post.dart';
import 'package:task/models/user.dart';

class UserService {
  Future<List<User>> getUsers() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(uri);
    final List<dynamic> jsonData = json.decode(response.body);
    List<User> users = jsonData.map((user) => User.fromJson(user)).toList();
    print(users);
    return users;
  }

  Future<List<Post>> getPost() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    final List<dynamic> jsonData = json.decode(response.body);
    List<Post> posts = jsonData.map((post) => Post.fromJson(post)).toList();
    print(posts);
    return posts;
  }
}
