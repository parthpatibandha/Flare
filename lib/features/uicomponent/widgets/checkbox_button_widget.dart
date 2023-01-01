import 'package:flutter/material.dart';
import 'package:flare/core/utils/logger.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckBoxButtonWidget extends StatefulWidget {
  @override
  _CheckBoxButtonWidgetState createState() => _CheckBoxButtonWidgetState();
}

class _CheckBoxButtonWidgetState extends State<CheckBoxButtonWidget> {
  List<MobileOS> osList = [
    MobileOS(isChecked: false, name: "Android"),
    MobileOS(isChecked: false, name: "iOS"),
    MobileOS(isChecked: false, name: "Windows"),
  ];

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
    return Container(
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                    title: Text(osList[0].name),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: osList[0].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          osList[0].isChecked = value!;
                        });
                      },
                    )),
                ListTile(
                    title: Text(osList[1].name),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: osList[1].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          osList[1].isChecked = value!;
                        });
                      },
                    )),
                ListTile(
                    title: Text(osList[2].name),
                    leading: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: osList[2].isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          osList[2].isChecked = value!;
                        });
                      },
                    )),
                ElevatedButton(
                    onPressed: () {
                      String selected = "Selected OS : \n";
                      if (osList != null) {
                        osList.forEach((element) {
                          if(element.isChecked){
                              selected = selected + "\n"  + " Name: " + element.name + " , iSChecked : "+ element.isChecked.toString();
                          }
                        });
                        Fluttertoast.showToast(msg: selected);
                      }
                    },
                    child: Text("Save"))
              ],
            ),
          )),
    );
  }
}

class MobileOS {
  bool isChecked;
  String name;

  MobileOS({required this.isChecked, required this.name});
}
