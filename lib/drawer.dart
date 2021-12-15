import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

const themeColor = Colors.blue;

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> aboutBoxChildren = <Widget>[
      const SizedBox(height: 24),
      // RichText(),
      Linkify(
        onOpen: _onOpen,
        text: "GitHub: https://github.com/Sciroccogti/pool_counter",
      ),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Pool Counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(IconData(0xe61e, fontFamily: "iconfont"), color: Colors.red,),
            title: const Text('Snooker'),
            onTap: () {
              Navigator.pushNamed(context, '/snooker');
            },
          ),
          ListTile(
            leading: const Icon(IconData(0xe63a, fontFamily: "iconfont"), color: Colors.black,),
            title: const Text('Eight-ball'),
            enabled: false,
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          AboutListTile(
            icon: const Icon(Icons.info),
            applicationIcon: const FlutterLogo(),
            // TODO: substitute
            applicationName: 'Pool Counter',
            applicationVersion: 'v1.0',
            applicationLegalese: 'Made with love by Sciroccogti',
            aboutBoxChildren: aboutBoxChildren,
          ),
        ],
      ),
    );
  }
}
