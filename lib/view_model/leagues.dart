import 'package:flutter/cupertino.dart';

import '../models/leagues_results.dart';
import '../models/services/api.dart';

class Leagues extends ChangeNotifier {
  List<LeagueResults> list = [];
  bool loaded = false;
  Map map = {};

  Future<void> updateList() async {
    list = await Api().getLeagueData();
    rearrangeListToMap(list);
    loaded = true;
    notifyListeners();
  }

  void rearrangeListToMap(List<LeagueResults> list) {
    for (LeagueResults object in list) {
      map[object.leagueKey] = object;
    }
  }
}
