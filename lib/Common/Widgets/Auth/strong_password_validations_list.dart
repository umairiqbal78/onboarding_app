import 'package:dijelac/Common/Widgets/Auth/strong_password_validation_criteria_listtile.dart';
import 'package:dijelac/Common/Widgets/Auth/validation_password_checks_model.dart';
import 'package:dijelac/Localization/keys.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Contants/sizes.dart';
import 'package:flutter/material.dart';


class StrongPasswordValidationsList extends StatelessWidget {
  final PasswordValidationChecks passwordValidationChecks;
  const StrongPasswordValidationsList({super.key, required this.passwordValidationChecks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationsKeys.yourPasswordMustContain.translate(context),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: XColors.textColor),
        ),
        XSizes.sizeBoxSm(),
        ValidationCriteria(context: context, validationMessage: LocalizationsKeys.characters8.translate(context), validationRequirements: "", validationStatus: passwordValidationChecks.validationOfAtleast8Characters),
        XSizes.sizeBoxSm(),
        ValidationCriteria(context: context, validationMessage: LocalizationsKeys.lowercase1.translate(context), validationRequirements: " (a...z)", validationStatus: passwordValidationChecks.validationOfaLowerCase),
        XSizes.sizeBoxSm(),
        ValidationCriteria(context: context, validationMessage: LocalizationsKeys.uppercase1.translate(context), validationRequirements: " (A...Z)", validationStatus: passwordValidationChecks.validationOfanUpperCase),
        XSizes.sizeBoxSm(),
        ValidationCriteria(context: context, validationMessage: LocalizationsKeys.number1.translate(context), validationRequirements: " (0...9)", validationStatus: passwordValidationChecks.validationOfaNumber),
        XSizes.sizeBoxSm(),
        ValidationCriteria(context: context, validationMessage: LocalizationsKeys.specialCharacter1.translate(context), validationRequirements: " (.!@#\$%^()&*~)", validationStatus: passwordValidationChecks.validationOfaSpecialCase),
        XSizes.sizeBoxSm(),
      ],
    );
  }
}