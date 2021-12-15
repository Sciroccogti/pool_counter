import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

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
        text: "GitHub: https://github.com/Sciroccogti/foldest\n",
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
              'Drawer Header',
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
            title: const Text('斯诺克'),
            onTap: () {
              Navigator.pushNamed(context, '/snooker');
            },
          ),
          ListTile(
            leading: const Icon(IconData(0xe63a, fontFamily: "iconfont"), color: Colors.black,),
            title: const Text('八球'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          AboutListTile(
            icon: const Icon(Icons.info),
            applicationIcon: const FlutterLogo(),
            // TODO: substitute
            applicationName: 'Pool Counter',
            applicationVersion: 'v0.1',
            applicationLegalese: 'Made with love by Sciroccogti',
            aboutBoxChildren: aboutBoxChildren,
          ),
        ],
      ),
    );
  }
}
