import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/ColorItem.dart';

// Tab buttons selection provider
class GetColorData  extends ChangeNotifier {
  List<ColorItem> _colors = [];
  List<ColorItem> get getColorsList {
    return _colors;
  }
  void fetchColors(String url) async {
    http.Response response = await http.get(url);
      final colorsJSON = json.decode(response.body);
      _colors.clear();
      for (var colorJSON in colorsJSON) {
        final color = ColorItem(colorJSON["albumId"], colorJSON["id"],
            colorJSON["title"], colorJSON["url"], colorJSON["thumbnailUrl"]);
        _colors.add(color);
      }
      notifyListeners();
  }
}
