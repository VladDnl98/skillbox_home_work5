// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomeWorkExample extends StatefulWidget {
  const HomeWorkExample({Key? key}) : super(key: key);

  @override
  _HomeWorkExampleState get createState => _HomeWorkExampleState();
}

class _HomeWorkExampleState extends State<HomeWorkExample> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void toggleBottomSheet() {
    // ignore: prefer_conditional_assignment
    if (_controller == null) {
      _controller = scaffoldKey.currentState?.showBottomSheet(
        (context) => Container(
          color: Colors.blue[50],
          height: 200,
          child: Center(
            child: TextButton(
              onPressed: openDrawer,
              child: Text('Open Drawer'),
            ),
          ),
        ),
      );
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Home work 5'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://img.artlebedev.ru/everything/bezlimit/identity/morda/bezlimit-identity-1200.jpg'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.verified_user),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Images'),
              leading: Icon(Icons.image),
              trailing: Icon(Icons.arrow_forward),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ButtonBar(
                  buttonPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      child: Text('Выход'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text('Регистрация'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://avatars.mds.yandex.net/get-zen_doc/50335/pub_60ffb3ffae4fb342fd23fa67_60ffb45eae4fb342fd251503/scale_1200'),
              ),
            ),
            Text("Lion")
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 1,
        notchMargin: 1,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Shop",
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: toggleBottomSheet,
        label: Text("open"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
