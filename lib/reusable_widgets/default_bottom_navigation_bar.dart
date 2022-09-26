import 'package:flutter/material.dart';
import 'package:globesisters_test/post.dart';
import 'package:globesisters_test/profile.dart';

import '../feed.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final String root;
  static final navRoots = [
    Feed.routeName,
    Post.routeName,
    Profile.routeName,
  ];

  const DefaultBottomNavigationBar({super.key, required this.root});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: navRoots.indexOf(root),
        onTap: (int index) => (navRoots[index] != root)
            ? Navigator.pushReplacementNamed(context, navRoots[index])
            : null,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]);
  }
}
