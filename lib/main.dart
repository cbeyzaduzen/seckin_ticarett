import 'package:flutter/material.dart';
import 'package:seckin_ticarett/my_flutter_app_icons.dart';
import 'package:seckin_ticarett/sayfalar/bulasik.dart';
import 'package:seckin_ticarett/sayfalar/buzdolab%C4%B1.dart';
import 'package:seckin_ticarett/sayfalar/camasir.dart';
import 'package:seckin_ticarett/sayfalar/kucukevalet.dart';
import 'package:seckin_ticarett/sayfalar/tv.dart';
import 'package:flutter/widgets.dart';

void main() {
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
                    MyFlutterApp.fridge__1_,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    MyFlutterApp.dishwasher,
                    size: 40,
                    color: Colors.indigo[900],
                  )),
                  Tab(
                      icon: Icon(
                    MyFlutterApp.washing_machine,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    MyFlutterApp.tv_screen,
                    color: Colors.indigo[900],
                    size: 40,
                  )),
                  Tab(
                      icon: Icon(
                    MyFlutterApp.toaster,
                    color: Colors.indigo[900],
                    size: 30,
                  )),
                ],
              ),
              title: Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/seckinticaret.png",
                    cacheHeight: 250,
                    cacheWidth: 250,
                  ),
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
      ),
    );
  }
}
