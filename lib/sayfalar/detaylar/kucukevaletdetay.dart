import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class KucukEvAletDetayPage extends StatefulWidget {
  final int index;
  KucukEvAletDetayPage({this.index});

  @override
  _KucukEvAletDetayPageState createState() => _KucukEvAletDetayPageState();
}

class _KucukEvAletDetayPageState extends State<KucukEvAletDetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("KucukevaletDetay")
                .snapshots(),
            builder: (context, snapshot) {
              print("deneme 1234 " + widget.index.toString());
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
                  : Center(
                      child: Scaffold(
                        body: Container(
                          child: Column(
                            children: [
                              Center(
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
                              Container(
                                child: Image.network(
                                    snapshot.data.docs[widget.index]["foto"]),
                              ),
                              Text(snapshot.data.docs[widget.index]["icerik"]),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
