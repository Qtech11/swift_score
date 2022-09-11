import 'package:flutter/cupertino.dart';
import '../models/fixtures_results.dart';
import '../models/services/api.dart';

class FixturesByLeagueId extends ChangeNotifier {
  dynamic list = [];
  Map<String, List<FixturesResult>> map = {};
  List<String> keyList = [];
  List<List<FixturesResult>> valueList = [];

  Future<void> updateList(String date, String leagueId) async {
    list = [];
    map = {};
    keyList = [];
    valueList = [];
    list = await Api().getFixturesByLeagueId(date, leagueId);
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
