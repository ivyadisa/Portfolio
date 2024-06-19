import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0,),
                height: screenHeight/1.2,
                constraints: BoxConstraints(minHeight: 350.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hi\n I'm Ivy Adisa\n A Web developer", 
                        style: TextStyle(
                         fontSize:30.0,
                         height: 1.5,
                         fontWeight: FontWeight.bold,
                         color: CustomColor.whitePrimary,
                        ),
                        ),
                        SizedBox(height:15, ),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.yellowPrimary, // Sets the background color to orange
                             ),
                            onPressed: () {},
                           child: const Text("Get In Touch")
                           )
                           ),
                      ],
                    ),
                    Container(
                      width: screenWidth / 2,
                      child: Image.asset("assets/image.png"),
                    ),
                  ],
                )
    );          
  }
  
}
 