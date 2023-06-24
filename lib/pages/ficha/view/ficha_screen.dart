import 'package:cliinic_v2/pages/common/appbar.dart';
import 'package:flutter/material.dart';

class FichaScreen extends StatefulWidget {
  @override
  _FichaScreenState createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  List<MyObject> objects = [];

  @override
  void initState() {
    super.initState();
    // Fetch objects asynchronously and populate the list
    fetchObjects().then((fetchedObjects) {
      setState(() {
        objects = fetchedObjects;
      });
    });
  }

  Future<List<MyObject>> fetchObjects() async {
    // TODO: Make your asynchronous request to fetch the objects
    // Example:
    // final response = await http.get('https://api.example.com/objects');
    // final jsonData = jsonDecode(response.body);
    // final objects = jsonData.map((data) => MyObject.fromJson(data)).toList();
    // return objects;

    // Placeholder code to demonstrate the functionality
    await Future.delayed(Duration(seconds: 1));

    return [
      MyObject(name: 'Object 1', description: 'This is the first object'),
      MyObject(name: 'Object 2', description: 'This is the second object'),
      MyObject(name: 'Object 3', description: 'This is the third object'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: ListView.builder(
        itemCount: objects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(objects[index].name),
            subtitle: Text(objects[index].description),
            onTap: () {
              // TODO: Implement item tap functionality
              // You can navigate to a detailed view of the object or perform any other action.
            },
          );
        },
      ),
    );
  }
}

class MyObject {
  final String name;
  final String description;

  MyObject({required this.name, required this.description});

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
      name: json['name'],
      description: json['description'],
    );
  }
}
