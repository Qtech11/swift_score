class FixturesResult {
  FixturesResult({
    required this.eventKey,
    required this.eventDate,
    required this.eventTime,
    required this.eventHomeTeam,
    required this.homeTeamKey,
    required this.eventAwayTeam,
    required this.awayTeamKey,
    required this.eventHalftimeResult,
    required this.eventFinalResult,
    required this.eventFtResult,
    required this.eventPenaltyResult,
    required this.eventStatus,
    required this.countryName,
    required this.leagueName,
    required this.leagueKey,
    required this.leagueRound,
    required this.leagueSeason,
    required this.eventLive,
    required this.eventStadium,
    required this.eventReferee,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.eventCountryKey,
    required this.leagueLogo,
    required this.countryLogo,
    required this.eventHomeFormation,
    required this.eventAwayFormation,
    required this.fkStageKey,
    required this.stageName,
    required this.goalScorers,
    required this.substitutes,
    required this.cards,
    required this.lineUps,
    required this.statistics,
  });

  String eventKey;
  DateTime eventDate;
  String eventTime;
  String eventHomeTeam;
  String homeTeamKey;
  String eventAwayTeam;
  String awayTeamKey;
  String eventHalftimeResult;
  String eventFinalResult;
  String eventFtResult;
  String eventPenaltyResult;
  String eventStatus;
  String countryName;
  String leagueName;
  String leagueKey;
  String leagueRound;
  String leagueSeason;
  String eventLive;
  String eventStadium;
  String eventReferee;
  String homeTeamLogo;
  String awayTeamLogo;
  String eventCountryKey;
  String leagueLogo;
  String countryLogo;
  String eventHomeFormation;
  String eventAwayFormation;
  String fkStageKey;
  String stageName;
  List<GoalScorers> goalScorers;
  List substitutes;
  List<Cards> cards;
  LineUps lineUps;
  List<Statistics> statistics;

  factory FixturesResult.fromJson(Map<String, dynamic> json) {
    return FixturesResult(
      eventKey: json["event_key"],
      eventDate: DateTime.parse(json["event_date"]),
      eventTime: json["event_time"] ?? "",
      eventHomeTeam: json["event_home_team"] ?? "",
      homeTeamKey: json["home_team_key"] ?? "",
      eventAwayTeam: json["event_away_team"] ?? "",
      awayTeamKey: json["away_team_key"] ?? "",
      eventHalftimeResult: json["event_halftime_result"] ?? "",
      eventFinalResult: json["event_final_result"] ?? '',
      eventFtResult: json["event_ft_result"] ?? "",
      eventPenaltyResult: json["event_penalty_result"] ?? "",
      eventStatus: json["event_status"] ?? "",
      countryName: json["country_name"] ?? "",
      leagueName: json["league_name"] ?? "",
      leagueKey: json["league_key"] ?? "",
      leagueRound: json["league_round"] ?? "",
      leagueSeason: json["league_season"] ?? "",
      eventLive: json["event_live"] ?? "",
      eventStadium: json["event_stadium"] ?? "",
      eventReferee: json["event_referee"] ?? "",
      homeTeamLogo: json["home_team_logo"] ?? "",
      awayTeamLogo: json["away_team_logo"] ?? "",
      eventCountryKey: json["event_country_key"] ?? "",
      leagueLogo: json["league_logo"] ?? "",
      countryLogo: json["country_logo"] ?? "",
      eventHomeFormation: json["event_home_formation"],
      eventAwayFormation: json["event_away_formation"],
      fkStageKey: json["fk_stage_key"] ?? "",
      stageName: json["stage_name"] ?? "",
      goalScorers: List<GoalScorers>.from(
          json['goalscorers'].map((x) => GoalScorers.fromJson(x))),
      substitutes: json['substitute'] ?? [],
      cards: List<Cards>.from(json['cards'].map((x) => Cards.fromJson(x))),
      lineUps: LineUps.fromJson(json["lineups"]),
      statistics: List<Statistics>.from(
          json["statistics"].map((x) => Statistics.fromJson(x))),
    );
  }
}

class LineUps {
  LineUps({
    required this.home,
    required this.away,
  });
  Team home;
  Team away;

  factory LineUps.fromJson(Map<String, dynamic> json) {
    return LineUps(
      home: Team.fromJson(json['home']),
      away: Team.fromJson(json['away']),
    );
  }
}

class Team {
  Team({
    required this.startingLineUps,
    required this.substitutes,
    required this.coaches,
  });

  List<StartingLineUps> startingLineUps;
  List<StartingLineUps> substitutes;
  String coaches;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      startingLineUps: List<StartingLineUps>.from(
          json["starting_lineups"].map((x) => StartingLineUps.fromJson(x))),
      substitutes: List<StartingLineUps>.from(
          json["subtitutes"].map((x) => StartingLineUps.fromJson(x))),
      coaches: json['coaches'][0]['coache'],
    );
  }
}

class StartingLineUps {
  StartingLineUps(
      {required this.player,
      required this.playerNumber,
      required this.playerPosition,
      required this.playerKey});
  String player;
  String playerNumber;
  String playerPosition;
  String playerKey;

  factory StartingLineUps.fromJson(Map<String, dynamic> json) {
    return StartingLineUps(
      player: json['player'],
      playerNumber: json['player_number'],
      playerPosition: json['player_position'],
      playerKey: json['player_key'],
    );
  }
}

class Cards {
  Cards({
    required this.time,
    required this.homeFault,
    required this.card,
    required this.awayFault,
    required this.infoTime,
  });

  String time;
  String homeFault;
  String card;
  String awayFault;
  String infoTime;

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
        time: json['time'],
        homeFault: json['home_fault'],
        card: json['card'],
        awayFault: json['away_fault'],
        infoTime: json['info_time']);
  }
}

class Statistics {
  Statistics({required this.type, required this.home, required this.away});

  String type;
  String home;
  String away;

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      type: json['type'],
      home: json['home'],
      away: json['away'],
    );
  }
}

class GoalScorers {
  GoalScorers({
    required this.time,
    required this.homeScorer,
    required this.homeAssist,
    required this.awayScorer,
    required this.awayAssist,
    required this.score,
  });

  String time;
  String homeScorer;
  String homeAssist;
  String awayScorer;
  String awayAssist;
  String score;

  factory GoalScorers.fromJson(Map<String, dynamic> json) {
    return GoalScorers(
      time: json['time'],
      homeScorer: json['home_scorer'],
      homeAssist: json['home_assist'],
      awayScorer: json['away_scorer'],
      awayAssist: json['away_assist'],
      score: json['score'],
    );
  }
}
