import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/View/Search/search_page.dart';
import 'package:reddit/View/Settings/create_community_page.dart';
import 'package:reddit/View/MainPages/communities_page.dart';
import 'package:reddit/View/Settings/saved_posts_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:reddit/View/MainPages/add_post_page.dart';
import 'package:flutter/material.dart';
import 'package:reddit/View/Settings/settings_page.dart';
import 'package:reddit/View/Settings/about_us_page.dart';
import 'package:reddit/View/Settings/profile_page.dart';
import 'package:reddit/View/MainPages/feed_page.dart';
import 'app_theme.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({Key key}) : super(key: key);
  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.mainColor),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppTheme.mainColor),
              accountName: Text(StaticFields.activeUser.username),
              accountEmail: Text(StaticFields.activeUser.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(StaticFields.activeUser.username[0]),
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
            title: const Text('Create a community'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateCommunity()));
            },
          ),
          ListTile(
            title: const Text('Saved posts'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SavedPosts()));
            },
          ),
          ListTile(
            title: const Text('About us'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Setting()));
            },
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
      backgroundColor: AppTheme.mainColor,
      color: Colors.white,
      style: TabStyle.reactCircle,
      items: const [
        TabItem(icon: Icons.add, title: "Add"),
        TabItem(icon: Icons.home_filled, title: "Home"),
        TabItem(icon: Icons.person_search_rounded, title: "Communities"),
      ],
      initialActiveIndex: FeedPage.selectedIndex,
      onTap: (int index) {
        setState(() {
          FeedPage.selectedIndex = index;
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AddPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FeedPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CommunitiesPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
              );
              break;
            default:
              break;
          }
        });
      },
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _textController,
      onSubmitted: (String value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchPage(value),
          ),
        );
      },
    );
  }
}
