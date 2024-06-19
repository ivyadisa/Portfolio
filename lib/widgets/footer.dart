import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                width: screenWidth/2,
                alignment: Alignment.center,
                child: const Text("Made By Ivy Adisa with flutetr",
                style:TextStyle(fontWeight: FontWeight.w400,
                color: CustomColor.whiteSecondary,
                )
              ),
              );
  }
}