import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Oyun").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Text('PLease Wait')
                : ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot products = snapshot.data.docs[index];
                      return Text(products["baslik"]);
                    },
                  );
          }),
    );
  }

  //burada veritabanında haberleri alıyoruz

  void getHaber() {
    FirebaseFirestore.instance.collection("Oyun").get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        print(value.docs[i]["baslik"]);
      }
    });
  }
}
