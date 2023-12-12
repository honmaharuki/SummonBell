import 'package:flutter/material.dart';

class BaseImage extends StatelessWidget {
  const BaseImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = MediaQuery.of(context).size.width;
          double imageWidth = width - 16;
          return Image.asset(
            'assets/images/sura.png',
            width: imageWidth,
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }
}
