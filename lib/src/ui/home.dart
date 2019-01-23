import 'package:flutter/material.dart';
import 'package:kloverseries_app/src/models/item_model.dart';
import 'package:kloverseries_app/src/blocs/home_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(new Home());

class Home extends StatelessWidget {
  final Future<Post> post;
  final ScrollController _scrollController = ScrollController();
  Home({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Kloverseries'),
      ),
      body: Center(
        child: FutureBuilder<List<HomeData>>(
          future: fetchHomeData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new GridView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Image.network('https://kloverseries.com/uploads/drama/${snapshot.data[index].image}')
                    ), 
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
              );
        
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<HomeData>> fetchHomeData() async {
    final response = await http.get('https://kloverseries.com/api/home');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<HomeData> dataList = createHomeDataList(responseJson);
    return dataList;
}

List<HomeData> createHomeDataList(List data){
  List<HomeData> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["title"];
    int id = data[i]["id"];
    String image = data[i]['image'];
    HomeData homedata = new HomeData(
      title: title,id: id, image: image);
    list.add(homedata);
  }
    
  return list;
}

Future<Post> fetchPost() async {
  final response = await http.get('http://kloverseries.com/api/home');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int id;
  final String title;

  Post({this.id, this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
    );
  }
}

class HomeData {
  int id;
  String title;
  String image;

  HomeData({ this.id, this.title, this.image });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      id: json['id'],
      title: json['title'],
      image: json['image']  
    );
  }
}