import 'package:flutter/material.dart';

class BuzdolabiPage extends StatefulWidget {
  @override
  _BuzdolabiPageState createState() => _BuzdolabiPageState();
}

class _BuzdolabiPageState extends State<BuzdolabiPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
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
      ),
    );
  }
}
