import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'es'];

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
    String? ptText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [ptText, enText, esText][languageIndex] ?? '';

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
    '02azcnp0': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Começo',
    },
  },
  // Logininit
  {
    '7u2qzlqu': {
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dignissim nunc, a vivamus blandit amet neque. Interdum facilisis euismod.',
      'en': '',
      'es': '',
    },
    'qiaefg50': {
      'pt': 'Vamos lá ?',
      'en': '',
      'es': '',
    },
    '72l1wcjb': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // OnboardingLogin
  {
    '5vdf9hdx': {
      'pt': 'Bem vindo ao Simple adm! O seu controle na palma de sua mão.',
      'en': '',
      'es': '',
    },
    'y6wstwiv': {
      'pt':
          'Aqui você irá gerenciar sua agenda de atendimentos, receberá as comandas de forma automatica, podendo acompanhar seus atendimentos. ',
      'en': '',
      'es': '',
    },
    'ij31y7vr': {
      'pt': 'Avançar',
      'en': '',
      'es': '',
    },
    'vbeyku87': {
      'pt': 'Calendário dinâmico, sua agenda semanal.',
      'en': '',
      'es': '',
    },
    '3wgqkhm0': {
      'pt':
          'Uma linha do tempo, mostrando sua agenda do dia, permitindo visualizar os próximos dias de atendimento.',
      'en': '',
      'es': '',
    },
    'f6z3c9eg': {
      'pt': 'Avançar',
      'en': '',
      'es': '',
    },
    'osewqdig': {
      'pt': 'Sem comandas de papeis, adotamos comandas virtuais.',
      'en': '',
      'es': '',
    },
    'zdxnhhr9': {
      'pt':
          'A funcionalidade faz a leitura do Qr code, que é gerado pelo app simple, assim que finalizar a sua reserva é gerado o seu qr code.',
      'en': '',
      'es': '',
    },
    '1w4n3fab': {
      'pt': 'Concluir',
      'en': '',
      'es': '',
    },
  },
  // LoginPage
  {
    '107xsv0t': {
      'pt': 'Entrar',
      'en': '',
      'es': '',
    },
    'qfzsl4gy': {
      'pt': 'Por favor, insira suas credenciais para continuar',
      'en': '',
      'es': '',
    },
    'b5nagcmw': {
      'pt': 'E-mail ou celular',
      'en': '',
      'es': '',
    },
    'mcb9vr78': {
      'pt': 'Insira seu e-mail ou celular aqui...',
      'en': '',
      'es': '',
    },
    '7g4lk0sl': {
      'pt': 'Esqueci minha senha',
      'en': '',
      'es': '',
    },
    '7pvv0fcw': {
      'pt': 'Senha',
      'en': '',
      'es': '',
    },
    '1q6oj8q0': {
      'pt': 'Digite aqui a sua senha...',
      'en': '',
      'es': '',
    },
    '2dhzla7x': {
      'pt': 'Entrar',
      'en': '',
      'es': '',
    },
    'kahc71du': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Home
  {
    'hfkmfrfg': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // schedule
  {
    'ng65wfe8': {
      'pt': 'My Schedule',
      'en': '',
      'es': '',
    },
    'kc19e8pa': {
      'pt': '8:00 AM',
      'en': '',
      'es': '',
    },
    'gh4edaua': {
      'pt': 'Meeting with clients',
      'en': '',
      'es': '',
    },
    '8l8ev57a': {
      'pt': '10:00 AM',
      'en': '',
      'es': '',
    },
    '34msgt6k': {
      'pt': 'Team brainstorming session',
      'en': '',
      'es': '',
    },
    'rhfzjkwd': {
      'pt': '1:00 PM',
      'en': '',
      'es': '',
    },
    '6fcua0ip': {
      'pt': 'Lunch with colleagues',
      'en': '',
      'es': '',
    },
    '4rb55h3c': {
      'pt': '3:00 PM',
      'en': '',
      'es': '',
    },
    'pxpn6b1t': {
      'pt': 'Project presentation',
      'en': '',
      'es': '',
    },
    '5r7d1l3j': {
      'pt': '5:00 PM',
      'en': '',
      'es': '',
    },
    'zimfokis': {
      'pt': 'Gym workout',
      'en': '',
      'es': '',
    },
  },
  // profile
  {
    'lxhef3pi': {
      'pt': 'Nestor Nunes',
      'en': '',
      'es': '',
    },
    'fgrpqmbz': {
      'pt': 'Agenda ativa',
      'en': '',
      'es': '',
    },
    'fq6y6dzb': {
      'pt': 'Seus Ganhos',
      'en': '',
      'es': '',
    },
    'cd7dqxs9': {
      'pt': 'Especialidades',
      'en': '',
      'es': '',
    },
    'dlevdy8k': {
      'pt': 'Horário de atendimentos',
      'en': '',
      'es': '',
    },
    'tznx09km': {
      'pt': 'Sair',
      'en': '',
      'es': '',
    },
    '4oc1thc5': {
      'pt': 'Perfil',
      'en': '',
      'es': '',
    },
  },
  // qrcode
  {
    'vrpwvra3': {
      'pt': 'Leitura de QR Code',
      'en': '',
      'es': '',
    },
    'rjw36gui': {
      'pt': 'Ler QR Code',
      'en': '',
      'es': '',
    },
    '83rjx52d': {
      'pt': 'Leitor',
      'en': '',
      'es': '',
    },
  },
  // forgotpass
  {
    'iyg3389l': {
      'pt': 'Crie a sua conta agora!',
      'en': '',
      'es': '',
    },
    'fkwr0y6w': {
      'pt': 'Informe o seus dados para cadastro',
      'en': '',
      'es': '',
    },
    'vgglht3w': {
      'pt': 'Seu email',
      'en': '',
      'es': '',
    },
    '6t69196c': {
      'pt': 'Informe o seu email',
      'en': '',
      'es': '',
    },
    '4xlj3ufo': {
      'pt': 'Sua senha anterior',
      'en': '',
      'es': '',
    },
    'mb97ukbc': {
      'pt': 'Informe o sua senha anterior',
      'en': '',
      'es': '',
    },
    'nrkdieg1': {
      'pt': 'Senha',
      'en': '',
      'es': '',
    },
    'a4ae0126': {
      'pt': 'Crie sua senha',
      'en': '',
      'es': '',
    },
    'brg1li5r': {
      'pt': 'Confirme sua senha',
      'en': '',
      'es': '',
    },
    'dk3l07w6': {
      'pt': 'Resetar senha',
      'en': '',
      'es': '',
    },
    'yhw7x1pl': {
      'pt': 'Lembrei minha senha!',
      'en': '',
      'es': '',
    },
    'q5ygys3y': {
      'pt': ' Entrar',
      'en': '',
      'es': '',
    },
    'myj15rja': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // comanda
  {
    'f5o1u2at': {
      'pt': 'Suas Comandas',
      'en': '',
      'es': '',
    },
    '371e22wk': {
      'pt':
          'Aqui você terá os detalhes do serviço a ser realizado para o seu cliente. ',
      'en': '',
      'es': '',
    },
    'qcf9cjn2': {
      'pt': 'Nestor Nunes',
      'en': '',
      'es': '',
    },
    'p6x962i5': {
      'pt': 'Produtos',
      'en': '',
      'es': '',
    },
    '8341rlar': {
      'pt': 'Adicionar',
      'en': '',
      'es': '',
    },
    'gunelbfe': {
      'pt': 'Serviços',
      'en': '',
      'es': '',
    },
    'mo72ez5e': {
      'pt': 'Adicionar',
      'en': '',
      'es': '',
    },
    'iiwmy1ar': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // bar_home
  {
    'ti52udw3': {
      'pt': 'Bem vindo!',
      'en': '',
      'es': '',
    },
    'u5tge4w8': {
      'pt': '1',
      'en': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'iocof7n5': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1nvfbpmz': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '481fvzo6': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'va2ib54m': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'n4uyz4rr': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'bvsvy180': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'mt6y0ivi': {
      'pt': '',
      'en': '',
      'es': '',
    },
    's2ooww85': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'p76orgdn': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0bac1zbj': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '37l5c8fi': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'zkxbdmu9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'hecasfb4': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'aauzgytf': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0fjvabjo': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'rbz2xj8r': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'tv6nfzeh': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'xsjl8y9x': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'dpsdhzna': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'lxfngaum': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
