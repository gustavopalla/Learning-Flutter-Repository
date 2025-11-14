import 'dart:convert';

import 'package:appdioteste/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  Future<List<PostModel>> getPosts() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if(response.statusCode == 200){
      var JsonPosts = jsonDecode(response.body);
      return (JsonPosts as List).map((e) => PostModel. fromJson(e)).toList();
    } else{
      return [];
    }

  }

}