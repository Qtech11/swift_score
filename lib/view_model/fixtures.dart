import 'package:flutter/cupertino.dart';

import '../models/fixtures_results.dart';
import '../models/services/api.dart';

class Fixtures extends ChangeNotifier {
  dynamic list = [];
  bool loaded = false;
  Map<String, List<FixturesResult>> map = {};
  List<String> keyList = [];
  final List<List<FixturesResult>> valueList = [];

  Future<void> updateList(String date) async {
    list = await Api().getFixtures(date);
    if (list != 'no result') {
      rearrangeListToMap();
      convertMapKeyValueToList();
      notifyListeners();
    }
  }

  void rearrangeListToMap() {
    for (FixturesResult object in list) {
      final String key = object.leagueKey;
      if (map.containsKey(key)) {
        List<FixturesResult> c = map[key]!;
        c.add(object);
        map[key] = c;
      } else {
        map[key] = [object];
      }
    }
  }

  void convertMapKeyValueToList() {
    map.forEach((key, value) {
      keyList.add(key);
      valueList.add(value);
    });
  }
}
