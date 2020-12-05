import 'package:flutter/material.dart';

class TabsSelection extends ChangeNotifier {
  List<bool> _isSelected = [true,false];
  List<bool> get getIsSelectedList {
    return _isSelected;
  }
  void onTabPressed(int index){
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == index;
    }
    notifyListeners();
  }
}
