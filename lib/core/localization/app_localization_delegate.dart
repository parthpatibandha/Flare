// #docregion Delegate
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flare/core/localization/app_localization.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalization.languages().contains(locale.languageCode);


  @override
  Future<AppLocalization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
// #enddocregion Delegate