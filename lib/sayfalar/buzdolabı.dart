import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class BuzdolabiPage extends StatefulWidget {
  @override
  _BuzdolabiPageState createState() => _BuzdolabiPageState();
}

class _BuzdolabiPageState extends State<BuzdolabiPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Buzdolabi")
                  .snapshots(),
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
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(products["fiyat"]),
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

  //firebase e ekleme fonksiyonu
  CollectionReference users =
      FirebaseFirestore.instance.collection('kullanici');
  void addUser() {
    users
        .add({
          'full_name': "sero", // John Doe
          'company': "sero", // Stokes and Sons
          'age': 42 // 42
        })
        .then((value) => print(
            "User Added")) //buradaki then eğerki add fonksiyonu başarılı olursa burası çalışacaktır
        .catchError((error) => print("Failed to add user: $error"));
  }
}
