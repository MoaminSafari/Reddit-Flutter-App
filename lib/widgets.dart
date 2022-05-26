import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({Key key}) : super(key: key);
  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {
  int _drawerSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: UserAccountsDrawerHeader(
              //onDetailsPressed: ,
              accountName: Text('User'),
              accountEmail: Text('User@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('U'),
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelectedIndex = 0;
              });
            },
          ),
          ListTile(
            title: const Text('Create a community'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelectedIndex = 1;
              });
            },
          ),
          ListTile(
            title: const Text('Saved posts'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelectedIndex = 2;
              });
            },
          ),
          ListTile(
            title: const Text('About us'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _drawerSelectedIndex = 3;
              });
            },
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
            child: Row(
              children: [
                const Text('     Dark mode',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(
                  onChanged: (bool value) {
                    setState(() {
                      FeedPage.darkMode = value;
                    });
                  },
                  value: FeedPage.darkMode,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class PageAppBar extends StatefulWidget {
  const PageAppBar({Key key}) : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      color: Colors.white,
      style: TabStyle.reactCircle,
      backgroundColor: Colors.deepOrange,
      items: const [
        TabItem(icon: Icons.add, title: "Add"),
        TabItem(icon: Icons.home_filled, title: "Home"),
        TabItem(icon: Icons.person_search_rounded, title: "Communities"),
      ],
      initialActiveIndex: FeedPage.selectedIndex,
      onTap: (int index) {
        setState(() {
          FeedPage.selectedIndex = index;
        });
      },
    );
  }
}
