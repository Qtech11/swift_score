import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/live_scores.dart';
import 'custom_box.dart';

class LiveScoresHorizontalList extends StatelessWidget {
  const LiveScoresHorizontalList(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    LiveScores liveScoresModel = Provider.of<LiveScores>(context);
    List<LiveScoresResult>? liveScoresList = liveScoresModel.list;
    return Container(
      width: double.infinity,
      height: height > width * 1.8 ? width / 1.8 : height / 3,
      padding: EdgeInsets.only(left: width * 0.05),
      child: ListView.separated(
        key: const PageStorageKey<String>('Second List'),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(height / 60),
                ),
              ),
              height: height > width * 1.8 ? width / 1.8 : height / 3,
              width: height > width * 1.8 ? width / 2.2 : height / 4,
              child: liveScoresList != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.025,
                                  vertical: width * 0.015),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(height / 60),
                                ),
                              ),
                              child: Text(
                                'Live',
                                style: TextStyle(
                                  fontSize: width / 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              liveScoresList[index].eventStatus,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width / 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: height / 20,
                              width: height / 20,
                              child: Image.network(
                                liveScoresList[index].homeTeamLogo,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.network(
                                      "https://www.clipartmax.com/png/middle/459-4590939_uefa-euro-logo-uefa-champions-league-sports-uefa-europa-league-2018-logo.png");
                                },
                              ),
                            ),
                            SizedBox(
                              height: height / 20,
                              width: height / 20,
                              child: Image.network(
                                liveScoresList[index].awayTeamLogo,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.network(
                                      "https://www.clipartmax.com/png/middle/459-4590939_uefa-euro-logo-uefa-champions-league-sports-uefa-europa-league-2018-logo.png");
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                liveScoresList[index].eventHomeTeam,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                            Text(
                              liveScoresList[index].eventFinalResult[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width / 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                liveScoresList[index].eventAwayTeam,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                            Text(
                              liveScoresList[index].eventFinalResult[4],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width / 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBox(
                              height: width / 17,
                              width: width / 10,
                            ),
                            CustomBox(
                              height: width / 30,
                              width: width / 20,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBox(
                              height: height / 20,
                              width: height / 20,
                            ),
                            CustomBox(
                              height: height / 20,
                              width: height / 20,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBox(
                              height: width / 30,
                              width: width / 5,
                            ),
                            CustomBox(
                              height: width / 30,
                              width: width / 25,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBox(
                              height: width / 30,
                              width: width / 5,
                            ),
                            CustomBox(
                              height: width / 30,
                              width: width / 25,
                            ),
                          ],
                        ),
                      ],
                    ));
        },
        itemCount: liveScoresList == null ? 6 : liveScoresList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: width * 0.05);
        },
      ),
    );
  }
}
