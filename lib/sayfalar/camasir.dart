import 'package:flutter/material.dart';

class CamasirPage extends StatefulWidget {
  @override
  _CamasirPageState createState() => _CamasirPageState();
}

class _CamasirPageState extends State<CamasirPage> {
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
