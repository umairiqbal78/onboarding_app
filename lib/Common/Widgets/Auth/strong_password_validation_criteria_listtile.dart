import 'package:dijelac/Localization/keys.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Contants/sizes.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class ValidationCriteria extends StatelessWidget {
  const ValidationCriteria({
    super.key,
    required this.context,
    required this.validationMessage,
    required this.validationRequirements,
    required this.validationStatus,
  });

  final BuildContext context;
  final String validationMessage;
  final String validationRequirements;
  final bool? validationStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (validationStatus == true)
          const Padding(
            padding: EdgeInsets.all(1.0),
            child: Icon(
              Icons.check,
              color: Color(0xFF00AA21),
              size: 16,
            ),
          )
        else
          Container(
            margin: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFF717171),
              shape: BoxShape.circle,
            ),
            height: 6,
            width: 6,
          ),
       XSizes.sizeBoxMm(),
        SizedBox(
          width: XHelperFunctions.screenWidth() * 0.70,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: LocalizationsKeys.atLeast.translate(context),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: validationStatus == true ? const Color(0xFF717171) : XColors.textColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                TextSpan(
                  text: validationMessage,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: validationStatus == true ? const Color(0xFF717171) : XColors.textColor,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                TextSpan(
                  text: validationRequirements,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: validationStatus == true ? const Color(0xFF717171) : XColors.textColor,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
