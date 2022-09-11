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
                    size: height / 22,
                  ),
                  SizedBox(
                    width: height / 3,
                    child: Image.asset('images/logo1.png'),
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: kTextColors,
                    size: height / 22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            const HomeLeague(),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.05, left: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live matches',
                    style: kTextStyle2(height),
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
                      style: kTextStyle1(height),
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
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                'News',
                style: kTextStyle2(height),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height / 40,
              ),
              height: height / 4,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(height / 60),
                ),
              ),
              child: Center(
                child: Text(
                  'No news available',
                  style: kTextStyle2(height),
                ),
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
        left: width * 0.05,
        top: width * 0.05,
        bottom: width * 0.05,
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
                style: kTextStyle2(height),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Text(
                  'View All',
                  style: kTextStyle1(height),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 35,
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
