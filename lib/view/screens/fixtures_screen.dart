import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/utilities/enums.dart';
import '../../view_model/fixtures.dart';

import '../widgets/fixtures_list.dart';
import '../widgets/horizontal_date_picker.dart';

class FixturesScreen extends StatelessWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        title: const Text('Fixtures'),
      ),
      body: Column(
        children: [
          HorizontalDatePicker(
            checkType: Type.isFixtures,
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.05),
          ),
          AllGroupsOfFixturesVerticalList(
            fixturesModel: Provider.of<Fixtures>(context),
          ),
        ],
      ),
    );
  }
}
