import 'package:flare/core/utils/app_constants.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class BrowserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BrowserScreenState();
  }
}

class BrowserScreenState extends State<BrowserScreen> {
  String url = "https://flutter.dev/learn";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBarWidget(message: StringConstants.screenBrowserUrlLaunch),
        body: Container(
          padding: EdgeInsets.all(AppConstants.sixteen),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => {_launchUrl()}, child: Text("Launch"))
            ],
          ),
        ));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
