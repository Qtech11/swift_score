import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/models/services/api.dart';
import 'package:swift_score/view/screens/home_screen.dart';
import 'package:swift_score/view/screens/match_details_screen.dart';
import 'package:swift_score/view_model/fixtures.dart';
import 'package:swift_score/view_model/fixtures_by_league_id.dart';
import 'package:swift_score/view_model/league_standing.dart';
import 'package:swift_score/view_model/leagues.dart';
import 'package:swift_score/view_model/live_scores.dart';
import 'package:swift_score/view_model/match_details.dart';
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
        ChangeNotifierProvider(create: (context) => Fixtures()),
        ChangeNotifierProvider(create: (context) => FixturesByLeagueId()),
        // ChangeNotifierProxyProvider<Fixtures, MatchDetails>(
        //   create: (context) => MatchDetails([]),
        //   update: (_, fixtures, matchDetailsNotifier) =>
        //       MatchDetails(fixtures.list),
        // ),
        ChangeNotifierProvider(create: (context) => MatchDetails()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseNavigationBar(),
      ),
    );
  }
}
