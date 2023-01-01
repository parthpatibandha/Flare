import 'package:flutter/material.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBarScreen extends StatefulWidget {
  AppBarScreen() : super(key: Key("AppBar"));

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  List<Widget> actionList = [
    InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: "Favourite Action button clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Icon(Icons.favorite)
      ),
    ),
    InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: "Download Action button clicked");
      },
      child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Icon(Icons.vertical_align_bottom_sharp)
      ),
    )
  ];

  List<Widget> actionListEmpty = List.empty(growable: true);
  bool leadingIcon = false;
  bool actionIcons = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget = null;
    List<Widget>? actionWidgets = null;
    if (leadingIcon) {
      leadingWidget = InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: "Leading button clicked");
        },
        child: Icon(Icons.add_alert),
      );
    }
    if (actionIcons) {
      actionWidgets = actionList;
    }

    return Scaffold(
      appBar: AppBarWidget(
        message: StringConstants.screenUiComponentAppBar,
        leading: leadingWidget,
        actionList: actionWidgets,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            ListTile(
                title: Text("Want to add leading icon"),
                leading: Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: leadingIcon,
                  onChanged: (bool? value) {
                    setState(() {
                      leadingIcon = value!;
                    });
                  },
                )),
            SizedBox(height: 20),
            ListTile(
                title: Text("Want to add Action icons"),
                leading: Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: actionIcons,
                  onChanged: (bool? value) {
                    setState(() {
                      actionIcons = value!;
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }
}
