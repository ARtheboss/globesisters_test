import 'package:flutter/material.dart';
import 'package:globesisters_test/reusable_widgets/default_app_bar.dart';
import 'package:globesisters_test/reusable_widgets/default_bottom_navigation_bar.dart';

class Post extends StatefulWidget {
  static const String routeName = '/post';

  const Post({super.key});

  @override
  PostState createState() => PostState();
}

class PostState extends State<Post> {
  TextEditingController _postContentController = TextEditingController();
  List<_Post> _posts = List.empty(growable: true);

  void buttonPressed() {
    setState(() {
      _posts
          .add(_Post(text: _postContentController.text, time: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "Post"),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(200, 50)),
                  child: TextFormField(
                    controller: _postContentController,
                  )),
              ElevatedButton(
                  onPressed: buttonPressed, child: const Text("Submit"))
            ],
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: (_posts.isEmpty)
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("You have no posts!"))
                : ListView.separated(
                    itemCount: _posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _posts[index];
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 10),
                  ),
          )
        ],
      ),
      bottomNavigationBar:
          const DefaultBottomNavigationBar(root: Post.routeName),
    );
  }
}

class _Post extends StatelessWidget {
  final String text;
  final DateTime time;
  const _Post({required this.text, required this.time});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.grey),
          child: Text(text),
        ))
      ],
    );
  }
}
