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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Container(
              width: 150,
              height: 150,
              child: Center(
                child: Image.network(
                  'https://via.placeholder.com/150', // Replace with your actual image URL
                  width: 100, // Set your preferred width
                  height: 100, // Set your preferred height
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
