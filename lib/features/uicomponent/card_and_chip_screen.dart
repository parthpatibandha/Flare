import 'package:flare/core/models/OptionItem.dart';
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

  bool isFavorite = false;
  int inputChipSingle = 3;
  int? selectedIndexInputChipSingle;

  List<OptionItem> optionList = [
    OptionItem(1, "Option 1", false),
    OptionItem(2, "Option 2", false),
    OptionItem(3, "Option 3", false),
  ];

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
            const Text("Card - Simple Text", style: Styles.h5Regular),
            const Card(
                color: ColorConstants.gray20,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Simple Text Card",
                    style: TextStyle(color: ColorConstants.white),
                  ),
                )),
            const SizedBox(height: 20),
            const Text("Card - Outlined", style: Styles.h5Regular),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: const ListTile(
                leading: Icon(Icons.map_outlined),
                title: Text("Flutter", style: Styles.h4SemiBold),
                subtitle: Text(StringConstants.dummyFlutterShort,
                    style: Styles.h5Regular),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Card - List Tile Action Buttons", style: Styles.h5Regular),
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
            const SizedBox(height: 20),
            const Text("Card - Network Image", style: Styles.h5Regular),
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

            const SizedBox(height: 20),
            const Text("Chip", style: Styles.h5Regular),
            Chip(
              labelPadding: EdgeInsets.all(2.0),
              avatar: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("F".toUpperCase()),
              ),
              label: Text("Flutter", style: Styles.h5Regular),
              backgroundColor: ColorConstants.gray10,
              elevation: 2.0,
              shadowColor: Colors.grey[60],
              padding: EdgeInsets.all(8.0),
            ),


            const SizedBox(height: 20),
            const Text("Action Chip", style: Styles.h5Regular),
            ActionChip(
              avatar: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              label: const Text('Save to favorites'),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),


            const SizedBox(height: 20),
            const Text("Input Chips - Single Selection With Delete", style: Styles.h5Regular),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5.0,
                      children: List<Widget>.generate(
                        inputChipSingle,
                            (int index) {
                          return InputChip(
                            label: Text('Option ${index + 1}'),
                            selected: selectedIndexInputChipSingle == index,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selectedIndexInputChipSingle == index) {
                                  selectedIndexInputChipSingle = null;
                                } else {
                                  selectedIndexInputChipSingle = index;
                                }
                              });
                            },
                            onDeleted: () {
                              setState(() {
                                inputChipSingle = inputChipSingle - 1;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              inputChipSingle = 3;
                            });
                          },
                          child: const Text('Reset'),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            if(selectedIndexInputChipSingle != null) {
                              var str = (selectedIndexInputChipSingle!! + 1).toString();
                              Fluttertoast.showToast(
                                  msg: "Selected option : " + str);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Selected option : Not selected");
                            }
                          },
                          child: const Text('Save'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),


            const SizedBox(height: 20),
            const Text("Filter Chips - Multiple Selection", style: Styles.h5Regular),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5.0,
                      children: List<Widget>.generate(
                        optionList.length,
                            (int index) {
                          return FilterChip(
                            avatar: CircleAvatar(
                              backgroundColor: ColorConstants.primary,
                              child: Text(optionList[index].name[0].toUpperCase()),
                            ),
                            label: Text(optionList[index].name),
                            selected: optionList[index].isSelected,
                            selectedColor: Colors.cyanAccent,
                            onSelected: (bool selected) {
                              setState(() {
                                optionList[index].isSelected = !optionList[index].isSelected;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            List<String> sList = List.empty(growable: true);
                            optionList.forEach((element) {
                              if(element.isSelected){
                                sList.add(element.name);
                              }
                            });
                            if(sList.isNotEmpty) {
                              var str = sList.toString();
                              Fluttertoast.showToast(
                                  msg: "Selected options : " + str);
                            } else {
                              Fluttertoast.showToast(msg: "Selected option : Not selected");
                            }
                          },
                          child: const Text('Save'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
