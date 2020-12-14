import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'detay.dart';

class BulasikPage extends StatefulWidget {
  @override
  _BulasikPageState createState() => _BulasikPageState();
}

class _BulasikPageState extends State<BulasikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Bulasik").snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    //loading page is here
                    ? Scaffold(
                        backgroundColor: Colors.amber,
                        body: Container(
                          child: LoadingFlipping.circle(
                            borderColor: Colors.white,
                            borderSize: 3.0,
                            size: 75.0,
                            backgroundColor: Colors.orange,
                            duration: Duration(milliseconds: 500),
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot products = snapshot.data.docs[index];
                          {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                child: Column(
                                  children: [
                                    Text(products["baslik"]),
                                    Expanded(
                                      child: Image.network(
                                        products["foto"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(products["fiyat"]),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 25,
                                        width: 100,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetayPage()),
                                            );
                                          },
                                          child: const Text(
                                            'OZELLIKLER',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.blueGrey[200],
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      );
              }),
        ),
      ),
    );
  }
}
