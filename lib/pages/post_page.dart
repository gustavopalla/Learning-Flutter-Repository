import 'package:appdioteste/model/post_model.dart';
import 'package:appdioteste/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  var postsRepository = PostRepository();

  var posts = <PostModel>[];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

carregarDados() async {
  var loadedPosts = await postsRepository.getPosts(); 

  setState(() {
    posts = loadedPosts;
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Posts'),),
        body: ListView.builder(
          itemBuilder: (_, index){
            var post = posts[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Card(
                child: Text(post.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              ),
            );
          },
          itemCount: posts.length,
          ),
      ));
  }
}