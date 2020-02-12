import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconImage extends StatelessWidget {

  String imageName;

  IconImage(this.imageName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: new BoxDecoration(
        color: Color(0x33ffffff),
        borderRadius: new BorderRadius.all(Radius.circular(12),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/icons/"+ imageName +".svg",
          color: Colors.white,
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
