import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'ar', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? arText = '',
    String? zh_HansText = '',
  }) =>
      [enText, esText, frText, arText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'bw4pjrdm': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Miscellaneous
  {
    'ofmpa6s6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qe6839wg': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'r66e13kl': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'h7spplgf': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9inr6eo8': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'okw8l1n1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2034y04x': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '05qrvl5h': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'bgufxxgp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0vq4wxug': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'eszcr0p8': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'l0n9xin4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'w3pzq3e0': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'q2qta3pj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '25s2se20': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pnnoww4g': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '82oxccka': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tupisyhd': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ez4nyw2g': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'x5fw7alj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yuz4oa8q': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2puzz3c0': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'pfzlz06c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
