import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';

import '../../models/fixtures_results.dart';
import '../../view_model/fixtures.dart';
import '../../view_model/league_standing.dart';
import '../utilities/styles.dart';
import '../widgets/cache_network_image.dart';
import '../widgets/custom_box.dart';
import 'league_standing_screen.dart';

class FixturesScreen extends StatelessWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        title: const Text('Fixtures'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: width * 0.05),
          ),
          const AllGroupsOfFixturesVerticalList(),
        ],
      ),
    );
  }
}

class AllGroupsOfFixturesVerticalList extends StatelessWidget {
  const AllGroupsOfFixturesVerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Fixtures fixturesModel = Provider.of<Fixtures>(context);
    Map<String, List<FixturesResult>> map = fixturesModel.map;
    List<String> keys = fixturesModel.keyList;
    List<List<FixturesResult>> values = fixturesModel.valueList;
    return Expanded(
      child: ListView.builder(
        key: const PageStorageKey<String>('fixtures'),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.02,
                  right: width * 0.02,
                  top: width * 0.02,
                  bottom: width * 0.005,
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
                                  width: width / 1.5,
                                  child: Text(
                                    values[index][0].leagueName,
                                    style: kTextStyle4(width),
                                  ),
                                ),
                                Text(
                                  values[index][0].countryName,
                                  style: kTextStyle5(width),
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
              GroupedFixturesVerticalList(
                values: values,
                index: index,
              ),
            ],
          );
        },
        itemCount: keys.isEmpty ? 5 : keys.length,
      ),
    );
  }
}

class GroupedFixturesVerticalList extends StatelessWidget {
  const GroupedFixturesVerticalList(
      {Key? key, required this.values, required this.index})
      : super(key: key);

  final List<List<FixturesResult>> values;
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return values.isEmpty
        ? Column(
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: width * 0.005,
                  ),
                  child:
                      CustomBox1(height: height / 20, width: double.infinity),
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
                        child: values[index][i].eventStatus == ""
                            ? Text(
                                values[index][i].eventTime,
                                style: kTextStyle3(width),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                values[index][i].eventStatus,
                                style: kTextStyle3(width),
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
                              style: kTextStyle4(width),
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
                              style: kTextStyle4(width),
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
                            style: kTextStyle4(width),
                          ),
                          SizedBox(
                            height: height / 60,
                          ),
                          values[index][i].eventFinalResult == "-"
                              ? Text(
                                  values[index][i].eventFinalResult[0],
                                  style: kTextStyle4(width),
                                )
                              : Text(
                                  values[index][i].eventFinalResult[4],
                                  style: kTextStyle4(width),
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
