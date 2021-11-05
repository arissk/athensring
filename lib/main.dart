import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Pages
import 'home_page.dart';
import 'info_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const AthensRing());
}

class AthensRing extends StatelessWidget {
  const AthensRing({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/info': (BuildContext context) => const InfoPage(),
      },
      title: 'Athens Ring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), //HomePage(),
    );
  }
}
