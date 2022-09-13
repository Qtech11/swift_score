import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/utilities/styles.dart';

import '../../models/fixtures_results.dart';
import '../../view_model/match_details.dart';
import '../widgets/cache_network_image.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    MatchDetails matchDetailsModel = Provider.of<MatchDetails>(context);
    String key = matchDetailsModel.key;
    FixturesResult? results = matchDetailsModel.liveScoresEventMap[key];
    List<Statistics> stat = results!.statistics;
    LineUps lineUps = results.lineUps;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(height: height, results: results, width: width),
        body: TabBarView(
          children: [
            StatisticsScreen(
              height: height,
              width: width,
              stat: stat,
              matchDetailsModel: matchDetailsModel,
            ),
            LineUpsScreen(
              height: height,
              lineUps: lineUps,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(height / 40),
                color: Colors.primaries[index],
                child: Center(
                  child: Text(
                    '$index',
                    style: kTextStyle2(height),
                  ),
                ),
              ),
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class LineUpsScreen extends StatelessWidget {
  LineUpsScreen({
    Key? key,
    required this.height,
    required this.lineUps,
  }) : super(key: key);

  final double height;
  final LineUps lineUps;

  late Team home = lineUps.home;
  late Team away = lineUps.away;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            for (int i = 0; i < home.startingLineUps.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    home.startingLineUps[i].player,
                    style: kTextStyle4(height),
                  ),
                  Text(
                    away.startingLineUps[i].player,
                    style: kTextStyle4(height),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}

AppBar customAppBar({
  required double height,
  required FixturesResult? results,
  required double width,
}) {
  return AppBar(
    primary: false,
    toolbarHeight: height / 8,
    backgroundColor: kBackgroundColor,
    flexibleSpace: results != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CacheNetworkImage(
                      imageUrl: results.homeTeamLogo,
                      height: height / 20,
                      width: height / 20,
                    ),
                    SizedBox(height: height / 100),
                    Text(
                      results.eventHomeTeam,
                      style: kTextStyle4(height),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    results.eventFinalResult,
                    style: kTextStyle2(height),
                  ),
                  SizedBox(
                    // width: width / 9,
                    child: results.eventStatus == ""
                        ? Text(
                            results.eventTime,
                            style: kTextStyle3(height),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            results.eventStatus,
                            style: kTextStyle3(height),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ],
              ),
              SizedBox(
                width: width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CacheNetworkImage(
                      imageUrl: results.awayTeamLogo,
                      height: height / 20,
                      width: height / 20,
                    ),
                    SizedBox(height: height / 100),
                    Text(
                      results.eventAwayTeam,
                      style: kTextStyle4(height),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )
        : null,
    centerTitle: true,
    bottom: TabBar(
      indicatorColor: kBaseSelectedIconColors,
      indicatorWeight: 1.5,
      labelStyle: kTextStyle7(height),
      unselectedLabelStyle: kTextStyle5(height),
      tabs: const [
        Tab(
          text: 'STATS',
        ),
        Tab(
          text: 'LINEUPS',
        ),
        Tab(
          text: 'TABLE',
        ),
      ],
    ),
  );
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({
    Key? key,
    required this.height,
    required this.width,
    required this.stat,
    required this.matchDetailsModel,
  }) : super(key: key);

  final double height;
  final double width;
  final List<Statistics> stat;
  final MatchDetails matchDetailsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('statistics'),
      padding: EdgeInsets.symmetric(vertical: height / 40),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height / 70,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stat[index].home,
                    style: kTextStyle4(height),
                  ),
                  Text(
                    stat[index].type,
                    style: kTextStyle4(height),
                  ),
                  Text(
                    stat[index].away,
                    style: kTextStyle4(height),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.44,
                    height: height / 90,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height / 90)),
                      child: LinearProgressIndicator(
                        color: matchDetailsModel.checkColor(
                          home: stat[index].type == "Ball Possession"
                              ? stat[index].away.substring(0, 1)
                              : stat[index].away,
                          away: stat[index].type == "Ball Possession"
                              ? stat[index].home.substring(0, 1)
                              : stat[index].home,
                        ),
                        backgroundColor: kBottomNavigationBarColor,
                        value: matchDetailsModel.calculateBarLength(
                          home: stat[index].type == "Ball Possession"
                              ? stat[index].home.substring(0, 1)
                              : stat[index].home,
                          away: stat[index].type == "Ball Possession"
                              ? stat[index].away.substring(0, 1)
                              : stat[index].away,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.44,
                    height: height / 90,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height / 90)),
                      child: LinearProgressIndicator(
                        color: matchDetailsModel.checkColor(
                          home: stat[index].type == "Ball Possession"
                              ? stat[index].home.substring(0, 1)
                              : stat[index].home,
                          away: stat[index].type == "Ball Possession"
                              ? stat[index].away.substring(0, 1)
                              : stat[index].away,
                        ),
                        backgroundColor: kBottomNavigationBarColor,
                        value: matchDetailsModel.calculateBarLength(
                          home: stat[index].type == "Ball Possession"
                              ? stat[index].away.substring(0, 1)
                              : stat[index].away,
                          away: stat[index].type == "Ball Possession"
                              ? stat[index].home.substring(0, 1)
                              : stat[index].home,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      itemCount: stat.length,
    );
  }
}
