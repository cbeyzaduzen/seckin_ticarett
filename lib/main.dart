import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seckin_ticarett/icons.dart';
import 'package:seckin_ticarett/sayfalar/bulasik.dart';
import 'package:seckin_ticarett/sayfalar/buzdolab%C4%B1.dart';
import 'package:seckin_ticarett/sayfalar/camasir.dart';
import 'package:seckin_ticarett/sayfalar/kucukevalet.dart';
import 'package:seckin_ticarett/sayfalar/tv.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[400],
              bottom: TabBar(
                tabs: [
                  Tab(
                      icon: Icon(
                    Semboller.fridge__1_,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    Semboller.dishwasher,
                    size: 40,
                    color: Colors.indigo[900],
                  )),
                  Tab(
                      icon: Icon(
                    Semboller.washing_machine,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    Semboller.tv_screen,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    Semboller.toaster,
                    color: Colors.indigo[900],
                    size: 30,
                  )),
                ],
              ),
              title: Expanded(
                child: Center(
                  child: Text(
                    "Seçkin Ticaret",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                BuzdolabiPage(),
                BulasikPage(),
                CamasirPage(),
                TvPage(),
                KucukevaletPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
