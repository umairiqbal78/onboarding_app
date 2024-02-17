import 'package:dijelac/Utils/Network/API.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dijelac/Localization/languages.dart';
import 'package:dijelac/Localization/localization_services.dart';
import 'package:dijelac/Routes/app_pages.dart';
import 'package:dijelac/Utils/Local_Storage/local_storage.dart';
import 'package:dijelac/Utils/Themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const RestartWidget(child:MyApp()));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DIJELAC.HR',
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

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}