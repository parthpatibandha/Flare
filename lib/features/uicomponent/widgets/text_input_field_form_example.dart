import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextAutoValidateModeExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextAutoValidateModeExampleState();
  }
}

class _TextAutoValidateModeExampleState extends State<TextAutoValidateModeExample> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Error Showed if Field is Empty on Submit button Pressed'),
          TextField(
            controller: _text,
            decoration: InputDecoration(
              labelText: 'Enter the Value',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
            onChanged: (text) {
              setState(() {
                _text.text.isEmpty ? _validate = true : _validate = false;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _text.text.isEmpty ? _validate = true : _validate = false;
              });
              Fluttertoast.showToast(msg: "Value :" + _text.text.toString());
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
