import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:swift_score/view/utilities/enums.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/utilities/styles.dart';
import 'package:swift_score/view_model/fixtures_by_league_id.dart';

import '../../view_model/fixtures.dart';
import '../../view_model/league_standing.dart';

class HorizontalDatePicker extends StatelessWidget {
  HorizontalDatePicker({Key? key, required this.checkType}) : super(key: key);
  DateTime _selectedDate = DateTime.now();
  final Type checkType;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? key = Provider.of<LeagueStandings>(context).newKey;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: DatePicker(
        DateTime.now(),
        height: height / 8,
        width: height / 12,
        initialSelectedDate: _selectedDate,
        selectionColor: kBaseSelectedIconColors,
        selectedTextColor: Colors.white,
        dateTextStyle: kTextStyle5(height),
        dayTextStyle: kTextStyle5(height),
        monthTextStyle: kTextStyle5(height),
        onDateChange: (date) {
          _selectedDate = date;
          String formattedDate = _selectedDate.toString().split(" ").first;
          if (checkType == Type.isFixtures) {
            Provider.of<Fixtures>(context, listen: false)
                .updateList(formattedDate);
          } else if (checkType == Type.isFixturesById) {
            Provider.of<FixturesByLeagueId>(context, listen: false)
                .updateList(formattedDate, key!);
          }
          print(_selectedDate);
        },
      ),
    );
  }
}
