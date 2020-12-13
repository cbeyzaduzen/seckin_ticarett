import 'package:flutter/material.dart';

class KucukEvAletPage extends StatefulWidget {
  @override
  _KucukEvAletPageState createState() => _KucukEvAletPageState();
}

class _KucukEvAletPageState extends State<KucukEvAletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: [
                  Expanded(child: Image.asset("assets/buz.jpg")),
                  Text("Burada fiyat yazacak"),
                ],
              ),
            ),
            decoration: new BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.blueGrey[300],
                  blurRadius: 5.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
