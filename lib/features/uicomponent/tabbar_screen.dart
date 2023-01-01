import 'package:flutter/material.dart';
import 'package:flare/core/utils/string_constants.dart';

class TabbarScreen extends StatefulWidget {
  TabbarScreen() : super(key: Key(StringConstants.screenUiComponentTabBar));

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.screenUiComponentTabBar),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.card_travel),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text("Home Screen"),
          ),
          Center(
            child: Text("Search Screen"),
          ),
          Center(
            child: Text("Cart Screen"),
          )
        ],
      ),
    );
  }
}
