 import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  // Constructor for the StatelessWidget
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return  ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 500.0,
      ),
      child: Container(
                  margin: const EdgeInsets.symmetric(horizontal:40.0,vertical:30.0,),
                  height: screenSize.height/1.2,
                  constraints: const BoxConstraints(minHeight: 560.0,) ,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                  Image.asset("assets/image.png", 
                  width: screenWidth/4),
                  const SizedBox(height:30),
      
                      const Text
                      ("Hi\n I'm Ivy Adisa\n A Web developer", 
                          style: TextStyle(
                           fontSize:24.0,
                           height: 1.5,
                           fontWeight: FontWeight.bold,
                           color: CustomColor.whitePrimary,
                          ),
                          ),
                          SizedBox(height:15, ),
                          SizedBox(
                            width: 190,
                            child: ElevatedButton(onPressed: () {},
                             child: const Text("Get In Touch")
                             )
                             ),
      
                      
                    ],
                  ),
      
                ),
    );
                
  }
}