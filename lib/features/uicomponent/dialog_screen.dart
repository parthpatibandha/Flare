import 'package:flutter/material.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogScreen extends StatefulWidget {
  DialogScreen() : super(key: Key(StringConstants.screenUiComponentDialogs));

  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  DateTime? selectedDate = null;
  TimeOfDay? selectedTime = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: StringConstants.screenUiComponentDialogs,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Alert Dialog", style: Styles.h5Regular),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog();
              },
              child: Text("Alert Dialog"),
            ),
            SizedBox(height: 20),
            Text("Simple Dialog", style: Styles.h5Regular),
            ElevatedButton(
              onPressed: () {
                _showSimpleDialog();
              },
              child: Text("Simple Dialog"),
            ),
            SizedBox(height: 20),
            Text("Bottom Sheet", style: Styles.h5Regular),
            ElevatedButton(
              onPressed: () {
                _showBottomSheetDialog();
              },
              child: Text("Bottom Sheet Dialog"),
            ),
            SizedBox(height: 20),
            Text("Date Picker", style: Styles.h5Regular),
            Text(selectedDate == null //ternary expression to check if date is null
                ? 'No date was chosen!'
                : 'Picked Date: ${selectedDate.toString()}'),
            ElevatedButton(
              onPressed: () {
                _showDatePickerDialog();
              },
              child: Text("DatePicker Dialog"),
            ),
            SizedBox(height: 20),
            Text("Time Picker", style: Styles.h5Regular),
            Text(selectedTime == null //ternary expression to check if date is null
                ? 'No time was chosen!'
                : 'Picked Time: ${selectedTime.toString()}'),
            ElevatedButton(
              onPressed: () {
                _showTimePickerDialog();
              },
              child: Text("TimePicker Dialog"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBottomSheetDialog() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Share");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Delete");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.linked_camera),
                  title: Text("Camera"),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Camera");
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _showSimpleDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('SimpleDialog'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Picture');
                Fluttertoast.showToast(msg: "Take Picture");
              },
              child: Text('Take Picture'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Gallery');
                Fluttertoast.showToast(msg: "Gallery");
              },
              child: Text('Select From Gallery'),
            )
          ],
        );
      },
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(StringConstants.dummyFlutter),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Cancel");
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "OK");
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDatePickerDialog() async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  Future<void> _showTimePickerDialog() async {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      setState(() {
        selectedTime = pickedTime;
      });
    });
  }
}
