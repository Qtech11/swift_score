import 'package:flutter/material.dart';
import '../models/fixtures_results.dart';
import '../view/utilities/colors.dart';

class MatchDetails extends ChangeNotifier {
  List liveScoresList = [];
  List fixturesList = [];
  String key = '';
  Map<String, FixturesResult> liveScoresEventMap = {};
  Map<String, FixturesResult> fixturesEventMap = {};
  // List<String> eventKeyList = [];
  // List<FixturesResult> eventValueList = [];

  void updateList(dynamic newLiveScoresList, dynamic newFixturesList) {
    liveScoresList = newLiveScoresList;
    fixturesList = newFixturesList;
    rearrangeListToEventKeyMap();
    notifyListeners();
  }

  void rearrangeListToEventKeyMap() {
    if (liveScoresList.isNotEmpty) {
      for (FixturesResult object in liveScoresList) {
        final String key = object.eventKey;
        liveScoresEventMap[key] = object;
      }
    }
    for (FixturesResult object in fixturesList) {
      final String key = object.eventKey;
      fixturesEventMap[key] = object;
    }

    notifyListeners();
  }

  void setKey(String newKey) {
    key = newKey;
  }

  double calculateBarLength({required String home, required String away}) {
    double h = double.parse(home);
    double a = double.parse(away);
    double t = h + a;

    return h / t;
  }

  Color? checkColor({required String home, required String away}) {
    double h = double.parse(home);
    double a = double.parse(away);

    if (a == 0) {
      return kBottomNavigationBarColor;
    } else if (h == a) {
      return Colors.grey;
    } else if (h < a) {
      return kBaseSelectedIconColors;
    } else {
      return Colors.grey;
    }
  }
}

// class MatchDetails extends ChangeNotifier {
//   List list = [];
//   String key = '';
//   Map<String, FixturesResult> eventMap = {};
//   // List<String> eventKeyList = [];
//   // List<FixturesResult> eventValueList = [];
//
//   MatchDetails(this.list);
//
//   // update(dynamic newList) {
//   //   list = newList;
//   // }
//
//   void rearrangeListToEventKeyMap() {
//     if (list.isNotEmpty) {
//       for (FixturesResult object in list) {
//         final String key = object.eventKey;
//         eventMap[key] = object;
//       }
//     }
//
//     // eventMap.forEach((key, value) {
//     //   eventKeyList.add(key);
//     //   eventValueList.add(value);
//     // });
//     notifyListeners();
//   }
//
//   void setKey(String newKey) {
//     key = newKey;
//   }
// }
