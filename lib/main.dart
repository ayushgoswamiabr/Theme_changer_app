import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
        theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(title: Text("Dynamic Switching"), actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return {'logout', 'setting'}.map((String choice) {
                  return PopupMenuItem(value: choice, child: Text(choice));
                }).toList();
              },
              onSelected: handClick,
            )
          ]),
          body: Center(
            child: Text("Hello World"),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                Container(
                  color: Colors.black,
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text("ayush")
                    ],
                  ),
                ),
                ListTile(
                  title: Text("Enable Dark Theme"),
                  trailing:
                      Switch(value: snapshot.data, onChanged: bloc.changeTheme),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Enable Dark Theme"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

void handClick(String value) {
  switch (value) {
    case 'logout':
      print("breaking");
      break;
    case 'setting':
      print("breaking");
      break;
  }
}
