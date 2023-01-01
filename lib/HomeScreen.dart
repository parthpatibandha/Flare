import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flare/routes/app_route_names.dart';

class Chapter {
  String name;
  String route;

  Chapter({required this.name, required this.route});
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final List<Chapter> entries = <Chapter>[
    Chapter(name: "UI Component - AppBar", route: AppRoutes.uiComponentAppBar),
    Chapter(name: "UI Component - BottomNavBar", route: AppRoutes.uiComponentBottomNavigationBar),
    Chapter(name: "UI Component - Text & FormField", route: AppRoutes.uiComponentTextFormField),
    Chapter(name: "UI Component - Buttons", route: AppRoutes.uiComponentButton),
    Chapter(name: "UI Component - Drawer", route: AppRoutes.uiComponentDrawer),
    Chapter(name: "UI Component - TabBar", route: AppRoutes.uiComponentTabBar),
    Chapter(name: "UI Component - Dialogs & Alerts", route: AppRoutes.uiComponentDialogs),
    Chapter(name: "UI Component - Card & List Tile & Chip", route: AppRoutes.uiComponentCards),
    Chapter(name: "Bloc - Simple HTTP Api Call", route: AppRoutes.bloc),
    Chapter(name: "Localizations - EN/ES/AR", route: AppRoutes.localizations),
    Chapter(name: "Location", route: AppRoutes.location),
    Chapter(name: "Browser Demo", route: AppRoutes.browser),
    Chapter(name: "GraphQL", route: AppRoutes.graphQL),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: StringConstants.appName,
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              Chapter chapter = entries[index];
              String title = chapter.name;
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(title),
                  ),
                  onTap: () => {context.beamToNamed(chapter.route, data: chapter)},
                ),
              );
            }),
      ),
    );
  }
}
