import 'package:flutter/material.dart';

import '../feed.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final String root;
  static final navRoots = [
    Feed.routeName,
  ];

  const DefaultBottomNavigationBar({super.key, required this.root});

  void _navigationChange(int index) {
    ;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) =>
            Navigator.pushReplacementNamed(context, navRoots[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]);
  }
}
