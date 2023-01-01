import 'package:flutter/material.dart';
import 'package:flare/core/style/color_constants.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen() : super(key: Key("Drawer"));

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(message: StringConstants.screenUiComponentDrawer),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: ColorConstants.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/img/image_loader.gif',
                      image: 'https://picsum.photos/250?image=9',
                      width: 50,
                      height: 50,
                    ),
                    Text("Header", style: Styles.h4SemiBold),
                    Text(
                      "name@flutter.com",
                      style: Styles.h5Regular,
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Home");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Share");
              },
            ),
          ],
        ),
      ),
    );
  }
}
