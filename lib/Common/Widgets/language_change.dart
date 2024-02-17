import 'package:dijelac/Utils/Themes/text_theme.dart';
import 'package:flutter/material.dart';

class LanguageChangeWidget extends StatelessWidget {
  const LanguageChangeWidget({super.key,required this.avatarRadius,required this.assetScale,required this.label,
    });
  final double avatarRadius;
  final double assetScale;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: avatarRadius,
          child: ClipOval(
            child: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/icons/language.png',
                scale: assetScale,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(
            label,
            maxLines: 1,
            style: XTextThemes.lightTextTheme.displaySmall
        ),
      ],
    );
  }
}
