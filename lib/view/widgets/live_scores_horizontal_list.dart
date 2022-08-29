import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/live_scores.dart';
import '../utilities/styles.dart';
import 'cache_network_image.dart';
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
    dynamic liveScoresList = liveScoresModel.list;
    if (liveScoresList == 'no result') {
      return SizedBox(
        height: width / 2,
        width: width / 1.2,
        child: Text(
          'There is no live match Currently',
          style: kTextStyle5(width),
          textAlign: TextAlign.center,
        ),
      );
    } else {
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
                child: liveScoresList.isNotEmpty
                    ? OriginalList(
                        width: width,
                        height: height,
                        liveScoresList: liveScoresList,
                        index: index,
                      )
                    : LoadingIndicator(
                        width: width,
                        height: height,
                      ));
          },
          itemCount: liveScoresList.isEmpty ? 6 : liveScoresList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: width * 0.05);
          },
        ),
      );
    }
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class OriginalList extends StatelessWidget {
  const OriginalList({
    Key? key,
    required this.width,
    required this.height,
    required this.liveScoresList,
    required this.index,
  }) : super(key: key);

  final double width;
  final double height;
  final dynamic liveScoresList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.025, vertical: width * 0.015),
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
            CacheNetworkImage(
              imageUrl: liveScoresList[index].homeTeamLogo,
              height: height / 20,
              width: width / 20,
            ),
            CacheNetworkImage(
              imageUrl: liveScoresList[index].awayTeamLogo,
              height: height / 20,
              width: width / 20,
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
                liveScoresList[index].eventAwayTeam ?? "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width / 30,
                ),
              ),
            ),
            Text(
              liveScoresList[index].eventFinalResult[4] ?? "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: width / 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
