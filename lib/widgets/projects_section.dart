import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/projectcards.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return  Container(
               width: screenWidth,
               padding:const EdgeInsets.fromLTRB(25, 20, 25, 60,),
               child:  Column(
                 children: [
                    //projects title
                    Text(
                      "Projects",
                     style:TextStyle(
                       fontSize:24,
                       fontWeight:FontWeight.bold,
                      color:CustomColor.whitePrimary,
                     ),
                    ),
                    //projects 
                    const SizedBox(height: 50.0,),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for(int i=0; i<myProjectsUtils.length; i++)
                          Projectcards(
                            project:myProjectsUtils[i] ,
                          ),
                        ],
                      ),
                    ),
                    
                    
                      
                      
                    
                  ],
                ),
                
              );
  }
}