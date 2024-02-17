import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Contants/images_strings.dart';
import 'package:dijelac/Utils/Contants/sizes.dart';
import 'package:flutter/material.dart';

class XCustomDrawer extends StatelessWidget {
  const XCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 60.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration:  BoxDecoration(
                color: XColors.secondaryColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                XImageStrings.appLogo,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.favorite),
              title: Text('Favourites'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
