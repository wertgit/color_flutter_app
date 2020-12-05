import 'package:color_flutter_app/providers/GetColorData.dart';
import 'package:color_flutter_app/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/TabsSelection.dart';

class ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TabsSelection()),
        ChangeNotifierProvider.value(value: GetColorData()),
      ],
      child: MaterialApp(
        title: "ColorApp",
        home: MainPage(),
      ),
    );
  }
}
