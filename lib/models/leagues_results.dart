class LeagueResults {
  LeagueResults({
    required this.leagueKey,
    required this.leagueName,
    required this.countryKey,
    required this.countryName,
    required this.leagueLogo,
    required this.countryLogo,
  });

  String leagueKey;
  String leagueName;
  String countryKey;
  String countryName;
  String leagueLogo;
  String countryLogo;

  factory LeagueResults.fromJson(Map<String, dynamic> json) => LeagueResults(
        leagueKey: json["league_key"],
        leagueName: json["league_name"],
        countryKey: json["country_key"],
        countryName: json["country_name"],
        leagueLogo: json["league_logo"] ??
            "https://image.pngaaa.com/187/171187-middle.png",
        countryLogo: json["country_logo"] ??
            "https://image.pngaaa.com/187/171187-middle.png",
      );
}
