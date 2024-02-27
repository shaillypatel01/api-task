import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/item.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text("Fluid ui"),
        backgroundColor: Color(0XFF95ADBE),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.menu)),

        ],
      ),*/
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          List<Item>? items = snapshot.data;
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("No Data Available"),
            );
          }else{
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(items[index]),));
                  },
                  //leading: Text("${items[index].id}"),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.navigate_next_outlined),
                  title: Text("${items[index].title}"),
                );
              },
            );
          }
        },
      )
    );
  }

  Future<List<Item>> getData() async {
      String url = "https://jsonplaceholder.typicode.com/posts";
      final response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      print(response.statusCode);
      if(response.statusCode == 200){
        final List<dynamic> items = jsonDecode(response.body);
        return items.map((item) => Item.fromJson(item)).toList();
      }
      return [];
  }
}
