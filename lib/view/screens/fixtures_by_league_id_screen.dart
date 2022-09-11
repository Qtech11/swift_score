import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/utilities/enums.dart';
import 'package:swift_score/view_model/fixtures_by_league_id.dart';

import '../widgets/fixtures_list.dart';
import '../widgets/horizontal_date_picker.dart';

class FixturesByIdScreen extends StatelessWidget {
  const FixturesByIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: Column(
        children: [
          HorizontalDatePicker(
            checkType: Type.isFixturesById,
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.05),
          ),
          AllGroupsOfFixturesVerticalList(
            fixturesModel: Provider.of<FixturesByLeagueId>(context),
            checkType: Type.isFixturesById,
          ),
        ],
      ),
    );
  }
}
