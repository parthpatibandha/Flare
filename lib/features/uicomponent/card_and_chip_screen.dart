import 'package:flutter/material.dart';
import 'package:flare/core/style/color_constants.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardAndChipScreen extends StatefulWidget {
  CardAndChipScreen() : super(key: Key(""));

  @override
  _CardAndChipScreenState createState() => _CardAndChipScreenState();
}

class _CardAndChipScreenState extends State<CardAndChipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarWidget(message: StringConstants.screenUiComponentCardAndChips),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Card - Simple Text", style: Styles.h5Regular),
            Card(
                color: ColorConstants.gray20,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Simple Text Card",
                    style: TextStyle(color: ColorConstants.white),
                  ),
                )),
            SizedBox(height: 20),
            Text("Card - Outlined", style: Styles.h5Regular),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: ListTile(
                leading: Icon(Icons.map_outlined),
                title: Text("Flutter", style: Styles.h4SemiBold),
                subtitle: Text(StringConstants.dummyFlutterShort,
                    style: Styles.h5Regular),
              ),
            ),
            SizedBox(height: 20),
            Text("Card - List Tile Action Buttons", style: Styles.h5Regular),
            Card(
                child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.map_outlined),
                  title: Text("Flutter", style: Styles.h4SemiBold),
                  subtitle: Text(StringConstants.dummyFlutter,
                      style: Styles.h5Regular),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Button 1'),
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Button 1");
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Button 2'),
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Button 2");
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                )
              ],
            )),
            SizedBox(height: 20),
            Text("Card - Network Image", style: Styles.h5Regular),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                "https://placeimg.com/640/150/any",
                fit: BoxFit.cover,
                height: 150,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }
}
