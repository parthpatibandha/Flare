import 'package:flutter/material.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/logger.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flare/features/uicomponent/widgets/checkbox_button_widget.dart';
import 'package:flare/features/uicomponent/widgets/radio_button_widget.dart';
import 'package:flare/features/uicomponent/widgets/switch_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: StringConstants.screenUiComponentButton,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("UI Component - Button", style: Styles.h5Regular),
              TextButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "TextButton clicked");
                },
                child: Text("Text Button"),
              ),


              SizedBox(height: 20),
              Text("Elevated Button", style: Styles.h5Regular),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "ElevatedButton clicked");
                },
                child: Text("Elevated Button"),
              ),


              SizedBox(height: 20),
              Text("Outlined Button ", style: Styles.h5Regular),
              OutlinedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "OutlinedButton clicked");
                },
                child: Text("Outlined Button"),
              ),


              SizedBox(height: 20),
              Text("Floating Action Button ", style: Styles.h5Regular),
              FloatingActionButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "Clicked");
                },
                heroTag: "1",
                child: Icon(Icons.add_alert),
                backgroundColor: Colors.blueAccent,
              ),


              SizedBox(height: 20),
              Text("Floating Action Button - Label ", style: Styles.h5Regular),
              FloatingActionButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Clicked");
                  },
                  heroTag: "2",
                  child: Text("Action")),


              SizedBox(height: 20),
              Text("Floating Action Button - Extended ", style: Styles.h5Regular),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Row(
                  children: [Icon(Icons.share), Text("Share")],
                ),
                heroTag: "3",
              ),


              SizedBox(height: 20),
              Text("PopUp Menu Button", style: Styles.h5Regular),
              PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(child: Text("Option 1"), value: "Option 1",),
                    const PopupMenuItem(child: Text("Option 2"), value: "Option 2"),
                    const PopupMenuItem(child: Text("Option 3"), value: "Option 3")
                  ],
                onSelected: (value) {
                    Logger.d("Selected : " + value);
                    Fluttertoast.showToast(msg: "Selected : " + value);
                },
              ),


              SizedBox(height: 20),
              Text("Switch", style: Styles.h5Regular),
              SwitchWidget(),


              SizedBox(height: 20),
              Text("Radio Buttons", style: Styles.h5Regular),
              RadioButtonWidget(),


              SizedBox(height: 20),
              Text("CheckBox Buttons", style: Styles.h5Regular),
              CheckBoxButtonWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
