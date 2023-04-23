import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/screens/fixtures_by_league_id_screen.dart';
import 'package:swift_score/view/widgets/custom_box.dart';
import 'package:swift_score/view/widgets/league_table.dart';
import '../utilities/colors.dart';
import '../../view_model/league_standing.dart';
import '../../view_model/leagues.dart';
import '../utilities/styles.dart';
import '../widgets/cache_network_image.dart';

enum Tabs { all, home, away }

class LeagueStandingScreen extends StatelessWidget {
  const LeagueStandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map map = Provider.of<Leagues>(context).map;
    String? key = Provider.of<LeagueStandings>(context).newKey;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kBackgroundColor1,
          appBar: AppBar(
            backgroundColor: kBackgroundColor1,
            title: Row(
              children: [
                CacheNetworkImage(
                  imageUrl: map[key]!.countryLogo,
                  height: height / 30,
                  width: height / 30,
                ),
                SizedBox(
                  width: width / 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      map[key]!.leagueName,
                      style: kTextStyle6(height),
                    ),
                    Text(
                      map[key]!.countryName,
                      style: kTextStyle5(height),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Matches'),
                Tab(text: 'Table'),
              ],
              labelStyle: kTextStyle6(height),
            ),
          ),
          body: const TabBarView(
            children: [
              FixturesByIdScreen(),
              LeagueTable(),
            ],
          ),
        ),
      ),
    );
  }
}
