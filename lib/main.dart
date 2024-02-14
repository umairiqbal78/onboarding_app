import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onboarding/Features/OnBoardingAndSplash/splash_screen.dart';
import 'package:onboarding/Localization/languages.dart';
import 'package:onboarding/Localization/localization_services.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Helpers/scroll_behaviour.dart';
import 'package:onboarding/Utils/Local_Storage/local_storage.dart';
import 'package:onboarding/Utils/Themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dijelac',
      debugShowCheckedModeBanner: false,
      theme: XTheme.lightTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      ///localization
      locale: Locale(XLocalStorage().readData("locale") ?? Languages.en.name),
      supportedLocales: LocalizationService.supportedLocales,
      localizationsDelegates: LocalizationService.localizationsDelegate,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        if (locale != null) {
          return supportedLocales.firstWhere(
                (Locale element) =>
                element.languageCode.contains(locale.languageCode),
            orElse: () => supportedLocales.first,
          );
        } else {
          return null;
        }
      },
    );
  }
}