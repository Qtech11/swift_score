import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/models/leagues_title.dart';
import 'models/live_scores.dart';
// import 'package:swift_score/screens/splash_screen.dart';

import 'base_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LiveScores()),
        ChangeNotifierProvider(create: (context) => Leagues()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseNavigationBar(),
      ),
    );
  }
}
