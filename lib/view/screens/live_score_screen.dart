import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import '../../models/fixtures_results.dart';
import '../../view_model/league_standing.dart';
import '../../view_model/live_scores.dart';
import '../utilities/styles.dart';
import '../widgets/cache_network_image.dart';
import '../widgets/custom_box.dart';
import '../widgets/live_scores_horizontal_list.dart';
import 'league_standing_screen.dart';
import 'package:swift_score/view/utilities/enums.dart';

class LiveScoreScreen extends StatelessWidget {
  const LiveScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LiveScores liveScoresModel =
        Provider.of<LiveScores>(context, listen: false);
    dynamic liveScoresList = liveScoresModel.list;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Live Scores',
          style: kTextStyle2(height),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: width * 0.05),
          ),
          Hero(
            tag: 'list',
            child: LiveScoresHorizontalList(
                height: height / 1.3, width: width / 1.3),
          ),
          SizedBox(
            height: width * 0.05,
          ),
          liveScoresList == 'no result'
              ? Container()
              : const AllGroupsOfLiveScoresVerticalList(),
        ],
      ),
    );
  }
}

class AllGroupsOfLiveScoresVerticalList extends StatelessWidget {
  const AllGroupsOfLiveScoresVerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LiveScores liveScoresModel =
        Provider.of<LiveScores>(context, listen: false);
    List<String> keys = liveScoresModel.keyList;
    List<List<FixturesResult>> values = liveScoresModel.valueList;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.02,
                  right: width * 0.02,
                  top: width * 0.02,
                ),
                child: keys.isEmpty
                    ? Row(
                        children: [
                          CustomBox1(
                            height: width / 30,
                            width: width / 22,
                          ),
                          SizedBox(
                            width: width / 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomBox1(
                                height: width / 32,
                                width: width / 1.8,
                              ),
                              SizedBox(
                                height: width / 60,
                              ),
                              CustomBox1(height: width / 35, width: width / 3)
                            ],
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(),
                          ),
                          CustomBox1(height: width / 32, width: width / 32),
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          print(keys[index]);
                          Provider.of<LeagueStandings>(context, listen: false)
                              .updateKey(keys[index]);
                          Provider.of<LeagueStandings>(context, listen: false)
                              .updateList(keys[index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LeagueStandingScreen()));
                        },
                        child: Row(
                          children: [
                            CacheNetworkImage(
                                imageUrl: values[index][0].countryLogo,
                                height: height / 35,
                                width: width / 35),
                            SizedBox(
                              width: width / 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width / 1.4,
                                  child: Text(
                                    values[index][0].leagueName,
                                    style: kTextStyle6(height),
                                  ),
                                ),
                                Text(
                                  values[index][0].countryName,
                                  style: kTextStyle5(height),
                                ),
                              ],
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: width / 30,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
              ),
              GroupedLiveScoresVerticalList(
                values: values,
                width: width,
                height: height,
                index: index,
              ),
            ],
          );
        },
        itemCount: keys.isEmpty ? 3 : keys.length,
      ),
    );
  }
}

class GroupedLiveScoresVerticalList extends StatelessWidget {
  const GroupedLiveScoresVerticalList(
      {Key? key,
      required this.values,
      required this.width,
      required this.height,
      required this.index})
      : super(key: key);

  final List<List<FixturesResult>> values;
  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return values.isEmpty
        ? Column(
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: width * 0.005,
                  ),
                  child:
                      CustomBox1(height: height / 10, width: double.infinity),
                )
            ],
          )
        : Column(
            children: [
              for (int i = 0; i < values[index].length; i++)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: width * 0.005,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: width * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(height / 100),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 9,
                        child: Text(
                          values[index][i].eventStatus,
                          style: kTextStyle3(height),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Column(
                        children: [
                          CacheNetworkImage(
                            imageUrl: values[index][i].homeTeamLogo,
                            height: height / 40,
                            width: width / 40,
                          ),
                          SizedBox(
                            height: height / 60,
                          ),
                          CacheNetworkImage(
                            imageUrl: values[index][i].awayTeamLogo,
                            height: height / 40,
                            width: width / 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: width / 2,
                            child: Text(
                              values[index][i].eventHomeTeam,
                              style: kTextStyle6(height),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          SizedBox(
                            width: width / 2,
                            child: Text(
                              values[index][i].eventAwayTeam,
                              style: kTextStyle6(height),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      Column(
                        children: [
                          Text(
                            values[index][i].eventFinalResult[0],
                            style: kTextStyle6(height),
                          ),
                          SizedBox(
                            height: height / 60,
                          ),
                          Text(
                            values[index][i].eventFinalResult[4],
                            style: kTextStyle6(height),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
