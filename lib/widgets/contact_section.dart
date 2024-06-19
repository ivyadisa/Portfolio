import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child:  Column(
                  children: [
                    //title
                    Text("Get in Touch", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: CustomColor.whitePrimary,
                    ),
                    ),
                    SizedBox(height: 50.0,),
                    ConstrainedBox(
                      constraints:
                       BoxConstraints(
                        maxWidth: 700.0,
                        maxHeight: 100.0,
                       ),
                    child: 
                       LayoutBuilder(builder: (context,constraints){
                       if (constraints.maxWidth>=kMinDesktopWidth){
                        return buildNameEmailFieldDesktop();
                       }
                      //else
                      return buildNameEmailFieldMobile();
                       
                       }),
                    ),
                     
                    //message
                    const SizedBox(height: 15,),
                      ConstrainedBox(
                      constraints:
                       BoxConstraints(
                        maxWidth: 700.0,
                       ),
                        child: CustomTextField(
                         hintText: "message",
                         maxLines: 16,
                                             ),
                      ),
                     const SizedBox(height: 20.0,),
                   //send button

                    ConstrainedBox(
                      constraints:
                       BoxConstraints(
                        maxWidth: 700.0,
                       ),
                     child: SizedBox(
                       width: double.maxFinite,
                       child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPrimary, // Sets the background color to orange
                         ),
                         child: Text("Get in Touch",),
                       
                       ),
                     ),
                   ),
                   const SizedBox(height: 30.0,),
                   //divider
                    ConstrainedBox(
                      constraints:
                       BoxConstraints(
                        maxWidth: 300.0,
                       ),child: const Divider()
                       ),
                      const SizedBox(height: 15.0,),
                      //SNS icon buttons
                      Wrap(
                        spacing: 12, runSpacing:12, alignment: WrapAlignment.center, 
                        children: [
                          InkWell(
                            onTap: () {
                              js.context.callMethod('open', [SnsLinks.github]);
                            },
                            child:
                             Image.asset("assets/github.png", 
                             width: 28,),
                             ),
                         
                          InkWell(
                            onTap: () {
                              js.context.callMethod('open', [SnsLinks.linkedin]);
                            },
                            child: Image.asset("assets/linkedin.png", 
                            width: 28,
                            ),
                            ),
                         
                        ],
                      )

                  ],
                ),
              );
  }
  Row buildNameEmailFieldDesktop(){
                   return Row(
                   children:  [
                          //name
                           Flexible(
                            child: CustomTextField(
                              hintText: "Your Name",
                            ),
                           ),
                           //email
                          const SizedBox(width: 15.0,),
                            Flexible(
                            child: CustomTextField(
                              hintText: "Your email",
                            ),
                           ),
                           ],
                      
                      
    );
  }
  Column buildNameEmailFieldMobile(){
                   return Column(
                   children:  [
                          //name
                           Flexible(
                            child: CustomTextField(
                              hintText: "Your Name",
                            ),
                           ),
                           //email
                          const SizedBox(height: 15.0,),
                            Flexible(
                            child: CustomTextField(
                              hintText: "Your email",
                            ),
                           ),
                           ],
                      
                      
    );
  }
}