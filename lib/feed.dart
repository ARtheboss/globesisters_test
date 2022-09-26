import 'package:flutter/material.dart';
import 'package:globesisters_test/reusable_widgets/default_bottom_navigation_bar.dart';

class Feed extends StatefulWidget {
  static const routeName = '/';

  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<String> _imageUrls = List.empty(growable: true);

  List<String> populateUrls() {
    // replace with method to load posts from online
    return [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
      "https://cdn.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej-1280x720.png",
    ];
  }

  @override
  void initState() {
    _imageUrls = populateUrls();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: _imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Post(imageUrl: _imageUrls[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          const DefaultBottomNavigationBar(root: Feed.routeName),
    );
  }
}

class Post extends StatelessWidget {
  final String imageUrl;

  const Post({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
    );
  }
}
