import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'detaylar/camasirdetay.dart';

class CamasirPage extends StatefulWidget {
  @override
  _CamasirPageState createState() => _CamasirPageState();
}

class _CamasirPageState extends State<CamasirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Camasir").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      body: Container(
                        child: LoadingFlipping.circle(
                          borderColor: Colors.white,
                          borderSize: 3.0,
                          size: 75.0,
                          backgroundColor: Colors.white,
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
                                  Text(
                                    products["baslik"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Expanded(
                                    child: Image.network(
                                      products["foto"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 25,
                                      width: 110,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CamasirDetayPage(
                                                      index: index),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'ÖZELLİKLER',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 10),
                                    blurRadius: 10),
                              ],
                            ),
                          );
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
