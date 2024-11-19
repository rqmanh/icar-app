// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:icar/core/utils/shared_pref_helper.dart';

class LanguagesController {
  List<Lang> languages = language;
  Lang selectedLan = Lang(
      displayName: 'displayName',
      nameInEnglish: 'nameInEnglish',
      language: Language.Arabic);
  // PrefHelper.getLangCode();

  void setLang(Lang lang) {
    selectedLan = lang;

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        PrefHelper.instance.setLang(lang);
        PrefHelper.instance.setLangCode(lang.language.languageCode);
        // Get.updateLocale(lang.language.local).then((value) {
        //  Restart.restartApp();
        // });
      },
    );
  }
}

enum Language {
  Arabic,
  English,
}

List<Lang> language = [
  Lang(
      displayName: 'English',
      nameInEnglish: 'English',
      language: Language.English),
  Lang(
      displayName: 'العربية',
      nameInEnglish: 'Arabic',
      language: Language.Arabic),
];

extension LanguageExtension on Language {
  Locale get local {
    return Locale(languageCode);
  }

  String get languageCode {
    switch (this) {
      case Language.Arabic:
        return 'ar';

      case Language.English:
        return 'en';
    }
  }
}

class Lang {
  final String displayName;
  final String nameInEnglish;
  final Language language;

  Lang(
      {required this.displayName,
      required this.nameInEnglish,
      required this.language});
}
