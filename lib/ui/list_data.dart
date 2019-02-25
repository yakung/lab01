import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/post.dart';
import './list_view_post.dart';
class LISTDATA extends StatelessWidget{

  

  Future<List<Post>> loadPost() async{//ทำงานแบบไม่รอ
    Response resp = await get("https://jsonplaceholder.typicode.com/posts");//ยังไงก็จะรอ
    List<dynamic> data = json.decode(resp.body);
    List<Post> posts = List();
    data.forEach((d){
      posts.add(Post.fromJson(d));
    });
    print(posts.length);
    return posts;
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listdata"),
      ),
      body: FutureBuilder(
        future: loadPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return snapshot.hasData
          ? ListViewPosts(posts: snapshot.data):Center(child: CircularProgressIndicator(),);
        }
      ),
    );
 }
}