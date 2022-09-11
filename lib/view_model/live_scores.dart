import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_score/models/services/api.dart';
import '../models/live_scores_results.dart';

class LiveScores extends ChangeNotifier {
  dynamic list = [];
  bool loaded = false;
  Map map = {};
  Map<String, LiveScoresResult> eventMap = {};
  List<String> keyList = [];
  List<List<LiveScoresResult>> valueList = [];

  Future<void> updateList() async {
    list = [];
    map = {};
    keyList = [];
    valueList = [];
    list = await Api().getLiveScores();
    if (list != 'no result') {
      rearrangeListToMap();
      convertMapKeyValueToList();
      notifyListeners();
    }
    notifyListeners();
  }

  void rearrangeListToMap() {
    for (LiveScoresResult object in list) {
      final String key = object.leagueKey;
      if (map.containsKey(key)) {
        List<LiveScoresResult> c = map[key];
        c.add(object);
        map[key] = c;
      } else {
        map[key] = [object];
      }
    }
  }

  void rearrangeListToEventKeyMap() {
    for (LiveScoresResult object in list) {
      final String key = object.eventKey;
      map[key] = [object];
    }
  }

  void convertMapKeyValueToList() {
    map.forEach((key, value) {
      keyList.add(key);
      valueList.add(value);
    });
  }
}
