import 'package:flutter/material.dart';

class LanguageBottomBarItem extends BottomNavigationBarItem {
  LanguageBottomBarItem({
    required double avatarRadius,
    required double assetScale,
    required String label,
    BuildContext? context,
    bool awaitingApproval = false,
    Color? color,
  }) : super(
    tooltip: '',
    label: awaitingApproval ? '' : label,
    icon: Column(
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
        if (awaitingApproval)
          Text(
            label,
            maxLines: 2,
            style: Theme.of(context!).textTheme.bodySmall
          ),
      ],
    ),
  );
}