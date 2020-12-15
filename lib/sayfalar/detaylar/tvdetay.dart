import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class TvDetayPage extends StatefulWidget {
  final int index;
  TvDetayPage({this.index});
  @override
  _TvDetayPageState createState() => _TvDetayPageState();
}

class _TvDetayPageState extends State<TvDetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("TvDetay").snapshots(),
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.data.docs[widget.index]["baslik"],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Image.network(
                                      snapshot.data.docs[widget.index]["foto"]),
                                ),
                                Text(snapshot.data.docs[widget.index]["icerik"],
                                    style: TextStyle(fontSize: 18,)),
                              ],
                            ),
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
