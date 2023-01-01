import 'package:flare/core/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';

class BottomNavBarScreen extends StatefulWidget {
  BottomNavBarScreen() : super(key: Key("BottomNavScreen"));

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    OneScreen(),
    TwoScreen(),
    ThreeScreen(),
    FourScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "One",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: "Two",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible_forward_outlined),
            label: "Three",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_rounded),
            label: "Four",
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConstants.primary,
        unselectedItemColor: ColorConstants.primaryAssent,
      ),
    );
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: "One",
      ),
      backgroundColor: Colors.lightGreen,
      body: Container(
        child: Center(
          child: Text("One"),
        ),
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: "Two",
      ),
      backgroundColor: Colors.orange,
      body: Container(
        child: Center(
          child: Text("Two"),
        ),
      ),
    );
  }
}

class ThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: "Three",
      ),
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
          child: Text("Three"),
        ),
      ),
    );
  }
}

class FourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: "Four",
      ),
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: Text("Four"),
        ),
      ),
    );
  }
}
