import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RadioButtonWidget extends StatefulWidget {
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {

  MobileOS? _os;

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
                    title: const Text('Android'),
                    leading: Radio<MobileOS>(
                      value: MobileOS.Android,
                      groupValue: _os,
                      onChanged: (MobileOS? value) {
                        setState(() {
                          _os = value;
                        });
                      },
                    )
                ),

                ListTile(
                    title: const Text('iOS'),
                    leading: Radio<MobileOS>(
                      value: MobileOS.iOS,
                      groupValue: _os,
                      onChanged: (MobileOS? value) {
                        setState(() {
                          _os = value;
                        });
                      },
                    )
                ),

                ListTile(
                    title: const Text('Windows'),
                    leading: Radio<MobileOS>(
                      value: MobileOS.Windows,
                      groupValue: _os,
                      onChanged: (MobileOS? value) {
                        setState(() {
                          _os = value;
                        });
                      },
                    )
                ),




                ElevatedButton(onPressed: (){
                  if(_os != null) {
                    Fluttertoast.showToast(msg: "Selected OS : " + _os!.name.toString());
                  }
                }, child: Text("Save"))

              ],
            ),
          )),
    );
  }
}

enum MobileOS { Android, iOS, Windows }
