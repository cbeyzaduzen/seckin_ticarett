import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class DetayPage extends StatefulWidget {
  @override
  _DetayPageState createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Detay").snapshots(),
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
                    : Scaffold(
                        body: Container(
                          child: Column(
                            children: [
                              Center(
                                child: Expanded(
                                  child: Text(
                                    "ÖZELLİKLER",
                                    style: TextStyle(
                                      fontSize: 40,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = Colors.yellow[700],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Image.asset("assets/buz.jpg"),
                              ),
                              Expanded(
                                  child:
                                      Text("wdhlfjkerhcflehkcklçvjrvrhjkev")),
                            ],
                          ),
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
