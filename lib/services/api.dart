import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swift_score/models/live_scores.dart';

import '../models/leagues_title.dart';

String apiKey =
    'ec55452b5c1973fd92c5c7e1c6d3feb72ad6f84525d21a570a01780e2131070c';
String url = 'https://apiv2.allsportsapi.com';
String leagueDataUrl =
    'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=$apiKey';
String liveScoresUrl =
    'https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=$apiKey';

class Api {
  Future<dynamic> getLeagueData() async {
    try {
      http.Response response = await http.get(Uri.parse(leagueDataUrl));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic result = jsonDecode(response.body);
        return List<LeagueResults>.from(
            result['result'].map((x) => LeagueResults.fromJson(x)));
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getLiveScores() async {
    try {
      http.Response response = await http.get(Uri.parse(liveScoresUrl));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic result = jsonDecode(response.body);
        // if (result['success'] == '1') {
        // print(result['result'][0]);
        return List<LiveScoresResult>.from(
            result['result'].map((x) => LiveScoresResult.fromJson(x)));
        // return LiveTeamModel.fromJson(result['result'][0]);
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
