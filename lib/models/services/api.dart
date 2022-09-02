import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swift_score/models/live_scores_results.dart';

import '../fixtures_results.dart';
import '../leagues_results.dart';

const apiKey =
    '7a8f5d416cef1887c995ae679324e5be1af61373d4cb9f7aa3982fbfbaadae98';
const url = 'https://apiv2.allsportsapi.com/football';
const leagueDataUrl = '$url/?met=Leagues&APIkey=$apiKey';
const liveScoresUrl = '$url/?met=Livescore&APIkey=$apiKey';
String leagueStandings(String key) =>
    '$url/?&met=Standings&leagueId=$key&APIkey=$apiKey';
String fixtures(String date) =>
    '$url/?met=Fixtures&APIkey=$apiKey&from=$date&to=$date';
String fixturesByLeagueId(String date, String leagueId) =>
    '$url/?met=Fixtures&APIkey=$apiKey&from=$date&to=$date&leagueId=$leagueId';

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
        print('failed to load data');
      }
    } catch (e) {
      print('bad guy ${e.toString()}');
      // return <LeagueResults>[];
    }
  }

  Future<dynamic> getLiveScores() async {
    try {
      http.Response response = await http.get(Uri.parse(liveScoresUrl));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map result = jsonDecode(response.body);
        if (result.containsKey('result')) {
          return List<LiveScoresResult>.from(
              result['result'].map((x) => LiveScoresResult.fromJson(x)));
          // return LiveTeamModel.fromJson(result['result'][0]);
        } else {
          return 'no result';
        }
      } else {
        print('failed to load data');
      }
    } catch (e) {
      print('bad guy ${e.toString()}');
      return [];
    }
  }

  Future<dynamic> getLeagueStandings(String key) async {
    try {
      http.Response response = await http.get(Uri.parse(leagueStandings(key)));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic result = jsonDecode(response.body);
        return result["result"];
      } else {
        print('failed to load data');
      }
    } catch (e) {
      print('bad guy ${e.toString()}');
    }
  }

  Future<dynamic> getFixtures(String date) async {
    try {
      http.Response response = await http.get(Uri.parse(fixtures(date)));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map result = jsonDecode(response.body);
        if (result.containsKey('result')) {
          return List<FixturesResult>.from(
              result['result'].map((x) => FixturesResult.fromJson(x)));
        } else {
          return 'no result';
        }
      } else {
        print('failed to load data');
      }
    } catch (e) {
      print('bad guy ${e.toString()}');
      return [];
    }
  }

  Future<dynamic> getFixturesByLeagueId(String date, String leagueId) async {
    try {
      http.Response response =
          await http.get(Uri.parse(fixturesByLeagueId(date, leagueId)));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map result = jsonDecode(response.body);
        if (result.containsKey('result')) {
          return List<FixturesResult>.from(
              result['result'].map((x) => FixturesResult.fromJson(x)));
        } else {
          return 'no result';
        }
      } else {
        print('failed to load data');
      }
    } catch (e) {
      print('bad guy ${e.toString()}');
      return [];
    }
  }
}
