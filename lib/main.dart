import 'package:flutter/material.dart';
import 'package:seckin_ticarett/sayfalar/bulasik.dart';
import 'package:seckin_ticarett/sayfalar/buzdolab%C4%B1.dart';
import 'package:seckin_ticarett/sayfalar/camasir.dart';
import 'package:seckin_ticarett/sayfalar/kucukevalet.dart';
import 'package:seckin_ticarett/sayfalar/tv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car,color:  Colors.blueAccent,)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_car)),
              ],
            ),
            title: Center(
              child: Text(
                'Seçkin Ticaret',
                style: TextStyle(fontWeight: FontWeight.bold),
                
              ),
            ),
          ),
          body: TabBarView(
            children: [
              BuzdolabiPage(),
              CamasirPage(),
              BulasikPage(),
              TvPage(),
              KucukEvAletPage(),
            ],
          ),
        ),
      ),
    );
  }
}
