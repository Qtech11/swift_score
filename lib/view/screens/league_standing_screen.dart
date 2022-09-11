import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/screens/fixtures_by_league_id_screen.dart';
import 'package:swift_score/view/widgets/custom_box.dart';
import '../utilities/colors.dart';
import '../../view_model/league_standing.dart';
import '../../view_model/leagues.dart';
import '../utilities/styles.dart';
import '../widgets/cache_network_image.dart';

enum Tabs { all, home, away }

class LeagueStandingScreen extends StatefulWidget {
  const LeagueStandingScreen({Key? key}) : super(key: key);

  @override
  State<LeagueStandingScreen> createState() => _LeagueStandingScreenState();
}

class _LeagueStandingScreenState extends State<LeagueStandingScreen> {
  Tabs selected = Tabs.all;
  bool totalVisibility = true;
  bool homeVisibility = false;
  bool awayVisibility = false;
  Color totalColor = kBaseSelectedIconColors;
  Color homeColor = kBackgroundColor1;
  Color awayColor = kBackgroundColor1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map map = Provider.of<Leagues>(context).map;
    String? key = Provider.of<LeagueStandings>(context).newKey;
    final total = Provider.of<LeagueStandings>(context).totalList;
    final home = Provider.of<LeagueStandings>(context).homeList;
    final away = Provider.of<LeagueStandings>(context).awayList;
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
          body: TabBarView(
            children: [
              const FixturesByIdScreen(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: ListView(
                  key: const PageStorageKey<String>('tables'),
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    Row(
                      children: [
                        CustomContainer(
                          title: 'All',
                          onTap: () {
                            setState(() {
                              if (!totalVisibility) {
                                homeVisibility = false;
                                awayVisibility = false;
                                totalVisibility = true;
                                homeColor = kBackgroundColor1;
                                awayColor = kBackgroundColor1;
                                totalColor = kBaseSelectedIconColors;
                              }
                            });
                          },
                          color: totalColor,
                        ),
                        SizedBox(width: width * 0.02),
                        CustomContainer(
                          title: 'Home',
                          onTap: () {
                            setState(() {
                              if (!homeVisibility) {
                                totalVisibility = false;
                                awayVisibility = false;
                                homeVisibility = true;
                                totalColor = kBackgroundColor1;
                                awayColor = kBackgroundColor1;
                                homeColor = kBaseSelectedIconColors;
                              }
                            });
                          },
                          color: homeColor,
                        ),
                        SizedBox(width: width * 0.02),
                        CustomContainer(
                          title: 'Away',
                          onTap: () {
                            setState(() {
                              if (!awayVisibility) {
                                homeVisibility = false;
                                totalVisibility = false;
                                awayVisibility = true;
                                homeColor = kBackgroundColor1;
                                totalColor = kBackgroundColor1;
                                awayColor = kBaseSelectedIconColors;
                              }
                            });
                          },
                          color: awayColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    const CustomRow(
                      sn: '#',
                      title: 'Team',
                      played: 'P',
                      won: 'W',
                      draw: 'D',
                      loss: 'L',
                      gd: 'GD',
                      pts: "PTS",
                    ),
                    const Divider(
                      color: kTextColors,
                      height: 0,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Visibility(
                      visible: totalVisibility,
                      child: Standings(title: total),
                    ),
                    Visibility(
                      visible: homeVisibility,
                      child: Standings(title: home),
                    ),
                    Visibility(
                      visible: awayVisibility,
                      child: Standings(title: away),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        for (int index = 0; index < 20; index++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: height / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.46,
                  child: Row(
                    children: [
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width * 0.3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                      CustomBox(
                        height: height / 45,
                        width: width / 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class Standings extends StatelessWidget {
  const Standings({Key? key, required this.title}) : super(key: key);

  final List title;

  @override
  Widget build(BuildContext context) {
    return title.isNotEmpty
        ? Column(
            children: [
              for (int index = 0; index < title.length; index++)
                CustomRow(
                  sn: "${index + 1}",
                  played: title[index].standingPlayed,
                  title: title[index].standingTeam,
                  won: title[index].standingWin,
                  draw: title[index].standingDraw,
                  loss: title[index].standingLoss,
                  gd: title[index].standingGoalDifference,
                  pts: title[index].standingPoints,
                )
            ],
          )
        : Loading();
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    Key? key,
    required this.sn,
    required this.played,
    required this.title,
    required this.won,
    required this.draw,
    required this.loss,
    required this.gd,
    required this.pts,
    this.imageUrl,
  }) : super(key: key);

  final String sn;
  final String title;
  final String played;
  final String won;
  final String draw;
  final String loss;
  final String gd;
  final String pts;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.46,
            child: Row(
              children: [
                CustomText(text: sn),
                SizedBox(
                  width: width * 0.02,
                ),
                SizedBox(
                  // width: double.,
                  child: Text(
                    title,
                    style: kTextStyle6(height),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: played),
                CustomText(text: won),
                CustomText(text: draw),
                CustomText(text: loss),
                CustomText(text: gd),
                CustomText(text: pts),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 16,
      child: Text(
        text,
        style: kTextStyle6(height),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key, required this.title, required this.onTap, required this.color})
      : super(key: key);
  final Color color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width / 32),
        height: height / 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(height / 40),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: kTextStyle6(height),
          ),
        ),
      ),
    );
  }
}
