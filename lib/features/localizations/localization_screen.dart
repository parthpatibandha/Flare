import 'package:flare/core/utils/app_constants.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare/core/localization/app_localization.dart';

class CustomLocalizationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomLocalizationScreenState();
  }
}

class CustomLocalizationScreenState extends State<CustomLocalizationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          message: StringConstants.screenLocalization,
        ),
        body: Container(
          padding: EdgeInsets.all(AppConstants.sixteen),
          child: Column(
            children: [Text(AppLocalization.of(context).title)],
          ),
        ));
  }
}
