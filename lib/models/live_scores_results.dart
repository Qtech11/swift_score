class LiveScoresResult {
  LiveScoresResult({
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
    required this.lineups,
    required this.statistics,
  });

  String eventKey;
  String eventDate;
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
  List goalScorers;
  List substitutes;
  List cards;
  Map<String, dynamic> lineups;
  List statistics;

  factory LiveScoresResult.fromJson(Map<String, dynamic> json) {
    return LiveScoresResult(
      eventKey: json["event_key"],
      eventDate: json["event_date"],
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
      goalScorers: json['goalscorers'],
      substitutes: json['substitute'] ?? [],
      cards: json['cards'],
      lineups: json["lineups"],
      statistics: json["statistics"],
    );
  }
}
