import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onboarding/Localization/languages.dart';


class LocalizationService {
  final Locale locale;
  LocalizationService({required this.locale});
  static LocalizationService? of(BuildContext context) {
    return Localizations.of(context, LocalizationService);
  }


  String get _filePath => 'lib/Localization/localizableStrings/';
  Map<String, String> _localizedString = {};

  Future<void> load() async {
    final String jsonString = await rootBundle.loadString('$_filePath${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    _localizedString = jsonMap.map((String key, dynamic value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedString[key];
  }

  static List<Locale> supportedLocales = <Locale>[Locale(Languages.en.name, 'US'), Locale(Languages.es.name, 'ES'), Locale(Languages.fr.name, 'FR')];

  static const LocalizationsDelegate<LocalizationService> _delegate = _LocalizationServiceDelegate();

  static const List<LocalizationsDelegate<Object>> localizationsDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    _delegate
  ];
}

class _LocalizationServiceDelegate extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      Languages.en.name,
      Languages.es.name,
      Languages.fr.name,
    ].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    final LocalizationService service = LocalizationService(locale: locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}
