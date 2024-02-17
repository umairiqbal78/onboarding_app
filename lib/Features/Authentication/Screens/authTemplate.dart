import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Contants/images_strings.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({Key? key,required this.child}) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(height: XHelperFunctions.screenHeight() * 0.30,
                  width: XHelperFunctions.screenWidth(),
                  decoration: BoxDecoration(
                    color: XColors.secondaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                      XImageStrings.appLogo,
                      ),
                    )
                  ),
                ),
              ),
              Align(

                alignment: Alignment.bottomCenter,
                child: Container(height: XHelperFunctions.screenHeight() * 0.70,
                width: XHelperFunctions.screenWidth(),
                padding:const EdgeInsets.only(left: 26,right:26,top: 32,bottom: 24),
                decoration: BoxDecoration(
                  color: XColors.whiteColor,
                  borderRadius: BorderRadius.circular(28),

                ),
                  child: child,
               ),
              )
            ],
          ),
        ));
  }
}
