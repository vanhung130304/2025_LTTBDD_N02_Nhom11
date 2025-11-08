// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get searchHint {
    return Intl.message(
      'Search destinations...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  String get discover {
    return Intl.message('Discover', name: 'discover', desc: '', args: []);
  }

  String get newest {
    return Intl.message('Newest', name: 'newest', desc: '', args: []);
  }

  String get updateLocation {
    return Intl.message(
      'Update location',
      name: 'updateLocation',
      desc: '',
      args: [],
    );
  }

  String get tour {
    return Intl.message('Tour', name: 'tour', desc: '', args: []);
  }

  String get transport {
    return Intl.message('Transport', name: 'transport', desc: '', args: []);
  }

  String get hotel {
    return Intl.message('Hotel', name: 'hotel', desc: '', args: []);
  }

  String get popular {
    return Intl.message('Popular', name: 'popular', desc: '', args: []);
  }

  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  String get explore {
    return Intl.message('Explore', name: 'explore', desc: '', args: []);
  }

  String get destination {
    return Intl.message('Destination', name: 'destination', desc: '', args: []);
  }

  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  String get thamQuan {
    return Intl.message('Sightseeing', name: 'thamQuan', desc: '', args: []);
  }

  String get busTitle {
    return Intl.message('Bus', name: 'busTitle', desc: '', args: []);
  }

  String get recommendedBuses {
    return Intl.message('Recommended Buses', name: 'recommendedBuses', desc: '', args: []);
  }

  String get route {
    return Intl.message('Route', name: 'route', desc: '', args: []);
  }

  String get viewDetails {
    return Intl.message('View Details', name: 'viewDetails', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
