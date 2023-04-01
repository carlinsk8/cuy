// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bienvenidos a`
  String get welcomeTo {
    return Intl.message(
      'Bienvenidos a',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Hola`
  String get hello {
    return Intl.message(
      'Hola',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Autenticación`
  String get authtentication {
    return Intl.message(
      'Autenticación',
      name: 'authtentication',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get email {
    return Intl.message(
      'Correo',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get send {
    return Intl.message(
      'Enviar',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error inesperado`
  String get unexpectedErrorMessage {
    return Intl.message(
      'Ocurrió un error inesperado',
      name: 'unexpectedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Introduzca un email válido`
  String get invaliEmailMessage {
    return Intl.message(
      'Introduzca un email válido',
      name: 'invaliEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Requerido`
  String get requiredField {
    return Intl.message(
      'Requerido',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Lista de planes`
  String get planList {
    return Intl.message(
      'Lista de planes',
      name: 'planList',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get logout {
    return Intl.message(
      'Cerrar sesión',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Obtener info del dispositivo`
  String get titleInfoDevice {
    return Intl.message(
      'Obtener info del dispositivo',
      name: 'titleInfoDevice',
      desc: '',
      args: [],
    );
  }

  /// `Ordenar`
  String get sort {
    return Intl.message(
      'Ordenar',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Datos del dispositivo`
  String get infoDevice {
    return Intl.message(
      'Datos del dispositivo',
      name: 'infoDevice',
      desc: '',
      args: [],
    );
  }

  /// `Nombre del aplicación`
  String get appName {
    return Intl.message(
      'Nombre del aplicación',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `ID del aplicación`
  String get appID {
    return Intl.message(
      'ID del aplicación',
      name: 'appID',
      desc: '',
      args: [],
    );
  }

  /// `Versión de la aplicación`
  String get versionApp {
    return Intl.message(
      'Versión de la aplicación',
      name: 'versionApp',
      desc: '',
      args: [],
    );
  }

  /// `Marca/Modelo`
  String get brandModel {
    return Intl.message(
      'Marca/Modelo',
      name: 'brandModel',
      desc: '',
      args: [],
    );
  }

  /// `Sistema operativo`
  String get os {
    return Intl.message(
      'Sistema operativo',
      name: 'os',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get lang {
    return Intl.message(
      'Idioma',
      name: 'lang',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
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
