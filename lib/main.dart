import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
          backgroundColor: Colors.blue,
          elevation: 5,
          shadowColor: Colors.grey,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return NewsFeed(orientation: orientation);
          },
        ),
      ),
    );
  }
}

class NewsFeed extends StatelessWidget {
  final Orientation orientation;

  NewsFeed({required this.orientation});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of news articles
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              width: orientation == Orientation.portrait ? 80 : 120,
              height: orientation == Orientation.portrait ? 80 : 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text('News Title $index'),
            subtitle: Text('News Description $index'),

          ),
        );
      },
    );
  }
}
