import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/styles/styles.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavItemTap,});
  final Function(int) onNavItemTap;


  @override
  Widget build(BuildContext context) {
  

    return   Container(
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            width: double.maxFinite,
            decoration: kHeaderDecoration,
           child: Row(
            children: [
               SiteLogo(onTap: () {},),
              const Spacer(),
              for (int i = 0; i<navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: TextButton(
                  onPressed: () {
                    onNavItemTap(i);
                  },
                 child: Text(navTitles[i],
                   style: const TextStyle(
                   fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary

                 ),
                 ),
                 ),
              ),
            ],
            ),
          );
  }
}