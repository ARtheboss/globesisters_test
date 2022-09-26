import 'package:flutter/material.dart';
import 'package:globesisters_test/reusable_widgets/default_app_bar.dart';
import 'package:globesisters_test/reusable_widgets/default_bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  static const String routeName = "profile";
  final String _firstName = "Advay";
  final String _lastName = "Ratan";
  final String _profilePicture =
      "https://img1.wsimg.com/isteam/ip/a75b4c6f-2e2b-4727-9ca5-5b37d3dc2cab/image.png/:/rs=w:388,h:388,cg:true,m/cr=w:388,h:388";
  String _bio = "Hi! I'm a Flutter developer that goes to UC Berkeley!";
  final int _age = 18;
  final String _email = "advayratan@gmail.com";

  Widget infoList(var arr, String getter) {
    return Center(
      child: (arr != null)
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              itemBuilder: (context, index) {
                return Center(
                    child: Text(
                  arr[index][getter],
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ));
              },
              itemCount: arr.length,
              shrinkWrap: true,
              controller: ScrollController(keepScrollOffset: false),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const DefaultAppBar(title: "Profile"),
            body: PageView(children: <Widget>[
              Column(children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: 350.0,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Profile Picture
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    _profilePicture,
                                  ),
                                  radius: 100.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),

                                Text(
                                  "$_firstName $_lastName",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor),
                            child: Column(children: [
                              _ProfileCard(
                                  title: "Age", content: _age.toString()),
                              _ProfileCard(title: "Email", content: _email),
                              _ProfileCard(title: "Bio", content: _bio),
                            ])),
                      ],
                    ),
                  ),
                ),
              ])
            ]),
            bottomNavigationBar: const DefaultBottomNavigationBar(
              root: routeName,
            )));
  }
}

class _ProfileCard extends StatelessWidget {
  final String title, content;
  const _ProfileCard({required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
