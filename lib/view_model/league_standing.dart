import 'package:flutter/material.dart';
import 'package:swift_score/models/services/api.dart';
import '../models/league_standing_results.dart';

class LeagueStandings extends ChangeNotifier {
  List<LeagueStandingResult> totalList = [];
  List<LeagueStandingResult> homeList = [];
  List<LeagueStandingResult> awayList = [];
  String? newKey;

  void updateList(String key) async {
    totalList = [];
    homeList = [];
    awayList = [];
    notifyListeners();
    dynamic result = await Api().getLeagueStandings(key);
    totalList = mapToList(result["total"]);
    homeList = mapToList(result['home']);
    awayList = mapToList(result['away']);
    notifyListeners();
  }

  List<LeagueStandingResult> mapToList(result) {
    return List<LeagueStandingResult>.from(
        result.map((x) => LeagueStandingResult.fromJson(x)));
  }

  void updateKey(String key) {
    newKey = key;
  }
}
