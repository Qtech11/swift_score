import 'package:flutter/material.dart';

class Competitions extends StatelessWidget {
  Competitions({Key? key}) : super(key: key);

  final leagues = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return const ListTile();
          },
        ),
      ),
    );
  }
}
