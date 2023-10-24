import 'src/Models/image_model.dart';

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
  

  void _fetchImage() {
    setState(() async {
    _counter++; 
    var response = await get('https://jsonplaceholder.typicode.com/photos/$_counter' as Uri);
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    images.add(imageModel);
  });
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)),
        onPressed: _fetchImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
            
            IconButton(onPressed: () {}, 
          icon: const Icon(Icons.menu)),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {},
          ),
          
          FloatingActionButton(onPressed: _fetchImage,
          child: const Icon(Icons.add),
          
          )])
        ),
      );
    
  }
}
