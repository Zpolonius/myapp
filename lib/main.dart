import 'dart:core';

import 'src/Models/image_model.dart';
import 'src/widgets/image_list.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My first app!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ImageModel> images = [];
  

  void fetchImage() async {
    
    _counter++; 
    final response = await get(Uri.https('https://jsonplaceholder.typicode.com/photos/$_counter'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(()  {images.add(imageModel);
    
  });
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: const Text('Show me some images!'),
      ),
      body: ImageList(images.url),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
            
            IconButton(onPressed: () {}, 
          icon: const Icon(Icons.menu)),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {},
          ),
          
          FloatingActionButton(onPressed: fetchImage,
          child: const Icon(Icons.add),
          
          )])
        ),
      );
    
  }
}
