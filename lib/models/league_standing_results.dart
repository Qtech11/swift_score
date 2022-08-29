class LeagueStandingResult {
  String standingPlace;
  String standingTeam;
  String standingPlayed;
  String standingWin;
  String standingDraw;
  String standingLoss;
  String standingGoalDifference;
  String standingPoints;
  String teamKey;
  String leagueSeason;

  LeagueStandingResult({
    required this.standingPlace,
    required this.standingTeam,
    required this.standingPlayed,
    required this.standingWin,
    required this.standingDraw,
    required this.standingLoss,
    required this.standingGoalDifference,
    required this.standingPoints,
    required this.teamKey,
    required this.leagueSeason,
  });

  factory LeagueStandingResult.fromJson(Map<String, dynamic> json) {
    return LeagueStandingResult(
      standingPlace: json["standing_place"],
      standingTeam: json["standing_team"],
      standingPlayed: json["standing_P"],
      standingWin: json["standing_W"],
      standingDraw: json["standing_D"],
      standingLoss: json["standing_L"],
      standingGoalDifference: json["standing_GD"],
      standingPoints: json["standing_PTS"],
      teamKey: json["team_key"],
      leagueSeason: json["league_season"],
    );
  }
}
