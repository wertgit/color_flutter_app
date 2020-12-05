import 'package:flutter/material.dart';

class ColorListTile extends StatelessWidget {
  final String imageUrl;
  final String descText;
  ColorListTile(this.imageUrl, this.descText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            image: NetworkImage(imageUrl),
          ),
          Align(alignment: Alignment.centerLeft,child: Text(descText, overflow: TextOverflow.ellipsis, maxLines: 1))
        ],
      ),
    );
  }
}
