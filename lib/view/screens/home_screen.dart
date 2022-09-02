import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import '../../models/leagues_results.dart';
import '../../view_model/fixtures.dart';
import '../../view_model/leagues.dart';
import '../../view_model/live_scores.dart';
import '../utilities/styles.dart';
import '../widgets/cache_network_image.dart';
import '../widgets/custom_box.dart';
import '../widgets/live_scores_horizontal_list.dart';
import 'live_score_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<Leagues>(context, listen: false).updateList();
      Provider.of<LiveScores>(context, listen: false).updateList();
      Provider.of<Fixtures>(context, listen: false)
          .updateList(DateTime.now().toString().split(" ").first);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.sort,
                    color: kTextColors,
                    size: width / 12,
                  ),
                  SizedBox(
                    width: width / 1.7,
                    child: Image.asset('images/logo1.png'),
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: kTextColors,
                    size: width / 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 12,
            ),
            const HomeLeague(),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.05, left: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live matches',
                    style: kTextStyle2(width),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveScoreScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: kTextStyle1(width),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Hero(
              tag: 'list',
              child: LiveScoresHorizontalList(
                height: height,
                width: width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeLeague extends StatelessWidget {
  const HomeLeague({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Leagues leagueModel = Provider.of<Leagues>(context);
    List<LeagueResults>? leagueList = leagueModel.list;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width * 0.05),
      padding: EdgeInsets.only(
        left: width * 0.06,
        top: width * 0.07,
        bottom: width * 0.07,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Leagues',
                style: kTextStyle2(width),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Text(
                  'View All',
                  style: kTextStyle1(width),
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.05,
          ),
          SizedBox(
            width: double.infinity,
            height: height / 10,
            child: ListView.separated(
              key: const PageStorageKey<String>('First List'),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return leagueList.isEmpty
                    ? CustomBox(height: height / 10, width: height / 10)
                    : CacheNetworkImage(
                        imageUrl: leagueList[index].leagueLogo,
                        width: height / 10,
                        height: height / 10,
                      );
              },
              itemCount: leagueList.isEmpty ? 10 : leagueList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: width * 0.05,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
