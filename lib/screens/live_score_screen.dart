import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/widgets/live_scores_horizontal_list.dart';

import '../models/live_scores.dart';

class LiveScoreScreen extends StatelessWidget {
  const LiveScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.3;
    double width = MediaQuery.of(context).size.width / 1.3;
    LiveScores liveScoresModel =
        Provider.of<LiveScores>(context, listen: false);
    List<LiveScoresResult>? liveScoresList = liveScoresModel.list;
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      appBar: AppBar(
        backgroundColor: Color(0xff333333),
        title: const Text('Live Scores'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: width * 0.05),
          ),
          Hero(
            tag: 'list',
            child: LiveScoresHorizontalList(height: height, width: width),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                height: height / 10,
              );
            },
            itemCount: liveScoresList == null ? 20 : 20,
          ),
        ],
      ),
    );
  }
}
