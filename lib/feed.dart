import 'package:flutter/material.dart';
import 'package:globesisters_test/reusable_widgets/default_app_bar.dart';
import 'package:globesisters_test/reusable_widgets/default_bottom_navigation_bar.dart';

class Feed extends StatefulWidget {
  static const String routeName = '/';
  const Feed({super.key});

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  List<String> _imageUrls = List.empty(growable: true);

  List<String> populateUrls() {
    // replace with method to load posts from backend
    return [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
      "https://cdn.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej-1280x720.png",
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
      "https://thumbs.dreamstime.com/b/rainbow-love-heart-background-red-wood-60045149.jpg",
      "https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg",
      "https://petapixel.com/assets/uploads/2022/07/DALLEcopy-800x420.jpg",
      "https://media.npr.org/assets/img/2022/07/15/gettyimages-1241847737_slide-b56d376bea635c9606ffc04bee054a2860f1e06a.jpg",
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
      appBar: const DefaultAppBar(title: "Feed"),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: _imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return _FeedItem(imageUrl: _imageUrls[index]);
              },
            ),
          )
        ],
      ),
      bottomNavigationBar:
          const DefaultBottomNavigationBar(root: Feed.routeName),
    );
  }
}

class _FeedItem extends StatelessWidget {
  final String imageUrl;

  const _FeedItem({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        clipBehavior: Clip.hardEdge,
        fit: BoxFit.cover,
        child: Image(
          image: NetworkImage(imageUrl),
        ));
  }
}
