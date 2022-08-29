import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view_model/league_standing.dart';
import 'package:swift_score/view_model/leagues.dart';
import 'package:swift_score/view_model/live_scores.dart';
import 'view/widgets/base_navigation_bar.dart';

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
        ChangeNotifierProvider(create: (context) => LeagueStandings()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseNavigationBar(),
      ),
    );
  }
}
