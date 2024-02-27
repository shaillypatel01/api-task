import 'package:flutter/material.dart';
import 'package:task_assign/model/item.dart';

class DetailsScreen extends StatefulWidget {
  //const DetailsScreen({super.key});

  Item items;

  DetailsScreen(this.items);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState(items);
}

class _DetailsScreenState extends State<DetailsScreen> {
  Item items = Item();

  //Item items = Item();
  _DetailsScreenState(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluid ui"),
        backgroundColor: Color(0XFF95ADBE),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''
            Id : ${items.id}
            Title : ${items.title}
            Body : ${items.body}
            ''',maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle()),
            ],
        ),
      )
    );
  }
}
