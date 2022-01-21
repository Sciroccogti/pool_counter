import 'package:flutter/material.dart';
import 'drawer.dart';
import 'home.dart';
import 'snooker.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName, // used by the OS task switcher
      theme: ThemeData(
        primarySwatch: themeColor,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext ctx) => HomePage(),
        "/snooker": (BuildContext ctx) => Snooker(),
      },
      // turn off PageTransitionAnime
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/home") {
      //     return PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage());
      //   } else if (settings.name == "/snooker") {
      //     return PageRouteBuilder(pageBuilder: (_, __, ___) => Snooker());
      //   }
      //   return null;
      // },
    );
  }
}
