import 'package:color_flutter_app/custom/ToggleButtonView.dart';
import 'package:color_flutter_app/custom/ColorListTile.dart';
import 'package:color_flutter_app/providers/GetColorData.dart';
import 'package:color_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/TabsSelection.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var isSelected = Provider.of<TabsSelection>(context).getIsSelectedList;
    var colorsList = Provider.of<GetColorData>(context).getColorsList;
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_BAR_TITLE),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleButtons(
              borderWidth: 2,
              selectedColor: SELECTED_TAB_COLOR,
              selectedBorderColor: SELECTED_TAB_BORDER_COLOR,
              borderColor: Colors.white,
              children: <Widget>[ToggleButtonView("1"), ToggleButtonView("2")],
              isSelected: isSelected,
              onPressed: (int index) {
                // listen to false due to only dispatching an action to be performed.
                Provider.of<TabsSelection>(context, listen: false).onTabPressed(index);
                _onTabButtonSelected(context);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB (24,16,24,0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: colorsList.length,
                itemBuilder: (BuildContext context, int position) {
                  return ColorListTile(
                      colorsList[position].thumbnailUrl, colorsList[position].title);
                },
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait? 0.9:0.85,
                    crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait? 2:5),
              ),
            ),
          ),
        ]));
  }


  _onTabButtonSelected(BuildContext context) {
    var isSelected = Provider.of<TabsSelection>(context,listen: false).getIsSelectedList;
    var selectedPos = isSelected.indexWhere((value) => value);
    if (selectedPos == 0) {
      Provider.of<GetColorData>(context, listen: false).fetchColors(BUTTON_1_URL);
    }
    if (selectedPos == 1) {
      Provider.of<GetColorData>(context, listen: false).fetchColors(BUTTON_2_URL);
    }
  }

}