import 'package:flutter/material.dart';
import 'allsingleforms.dart';
import 'multeplayer.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("tic"),
                  centerTitle: true,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.red, Colors.black],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                  ),
                  bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      indicatorWeight: 5,
                      tabs: [
                        Tab(text: 'singleplayer'),
                        Tab(text: 'multeplayer')
                      ]),
                ),
                body: TabBarView(
                  children: [SINGLE(), Multeplayer()],
                )

                //Home(),
                ))),
  );
}
