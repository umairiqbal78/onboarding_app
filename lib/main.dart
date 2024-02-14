import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onboarding/Localization/languages.dart';
import 'package:onboarding/Localization/localization_services.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Helpers/helper_functions.dart';
import 'package:onboarding/Utils/Helpers/scroll_behaviour.dart';
import 'package:onboarding/Utils/Local_Storage/local_storage.dart';
import 'package:onboarding/Utils/Themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
  XHelperFunctions.configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dijelac',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = ScrollConfiguration(
          behavior: MyBehavior(),
          child: EasyLoading.init(builder: BotToastInit())(context, child),
        );
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
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