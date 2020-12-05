import 'package:flutter/material.dart';

class ToggleButtonView extends StatelessWidget {
  final String numberText;
  ToggleButtonView(this.numberText);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Container(
          width: 45,
          height: 45,
          child:Center(child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    width: 1.0
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(4.0)
                ),
              )
              ,child: Center(child: Text(numberText,style: TextStyle(color: Colors.white),)))) ,
        ),

      ],
    );
  }
}
