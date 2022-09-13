import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_score/models/services/api.dart';
import '../models/fixtures_results.dart';

class LiveScores extends ChangeNotifier {
  dynamic list = [];
  bool loaded = false;
  Map map = {};
  Map<String, FixturesResult> eventMap = {};
  List<String> keyList = [];
  List<List<FixturesResult>> valueList = [];

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
    for (FixturesResult object in list) {
      final String key = object.leagueKey;
      if (map.containsKey(key)) {
        List<FixturesResult> c = map[key];
        c.add(object);
        map[key] = c;
      } else {
        map[key] = [object];
      }
    }
  }

  void rearrangeListToEventKeyMap() {
    for (FixturesResult object in list) {
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
