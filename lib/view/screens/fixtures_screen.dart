import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/utilities/enums.dart';
import 'package:swift_score/view/utilities/styles.dart';
import '../../view_model/fixtures.dart';

import '../widgets/fixtures_list.dart';
import '../widgets/horizontal_date_picker.dart';

class FixturesScreen extends StatelessWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        title: Text(
          'Fixtures',
          style: kTextStyle2(height),
        ),
      ),
      body: Column(
        children: [
          HorizontalDatePicker(
            checkType: Type.isFixtures,
          ),
          AllGroupsOfFixturesVerticalList(
            fixturesModel: Provider.of<Fixtures>(context),
            checkType: Type.isFixtures,
          ),
        ],
      ),
    );
  }
}
