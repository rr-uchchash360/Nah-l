import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'bn', 'ar', 'fr'];

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
    String? bnText = '',
    String? arText = '',
    String? frText = '',
  }) =>
      [enText, bnText, arText, frText][languageIndex] ?? '';

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
  // Login
  {
    'zvie5mj9': {
      'en': 'Welcome Back!',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '4lk51puo': {
      'en': 'Login to access your account below.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '475cg9h0': {
      'en': 'Email',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ripyeok1': {
      'en': 'Enter your registered email',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '28e84miz': {
      'en': 'Password',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'lyf1sslk': {
      'en': 'Enter your password',
      'ar': 'كلمة المرور',
      'bn': 'পাসওয়ার্ড',
      'fr': 'Mot de passe',
    },
    'jc3vxzm5': {
      'en': 'Forget Password?',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'qrby8rf0': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
      'bn': 'প্রবেশ করুন',
      'fr': 'Connexion',
    },
    '5uzjtold': {
      'en': 'Don\'t have an account?',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'f9799biy': {
      'en': 'Create',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'fcqgdnom': {
      'en': 'Home',
      'ar': '',
      'bn': 'হোম',
      'fr': '',
    },
  },
  // Dashboard
  {
    'xpr4ywf5': {
      'en': 'Expense',
      'ar': 'مصروف',
      'bn': 'ব্যয়',
      'fr': 'Frais',
    },
    'm2qeqpvr': {
      'en': 'Income',
      'ar': 'دخل',
      'bn': 'আয়',
      'fr': 'Revenu',
    },
    'wtuqxcu3': {
      'en': 'Recent Transactions',
      'ar': 'التحويلات الاخيرة',
      'bn': 'সাম্প্রতিক লেনদেন',
      'fr': 'transactions récentes',
    },
    '71ds1nwd': {
      'en': 'Search your recent transactions here...',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'k5it61da': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'vn6lk295': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'be7byt9c': {
      'en': '৳5000',
      'ar': '5000 ين ياباني',
      'bn': '৳5000',
      'fr': '৳5000',
    },
    'uhjcfdyj': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'dsd2x5om': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    '3rik6him': {
      'en': '৳1000',
      'ar': '1000 ين',
      'bn': '৳1000',
      'fr': '৳1000',
    },
    'dy843uil': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    '78uqxl9p': {
      'en': 'Welcome Back!',
      'ar': 'مرحبًا بعودتك!',
      'bn': 'ফিরে আসার জন্য স্বাগতম!',
      'fr': 'Content de te revoir!',
    },
    '5n5n5ws1': {
      'en': 'Home',
      'ar': '',
      'bn': 'হোম',
      'fr': '',
    },
  },
  // SignUp
  {
    'vlbqewfk': {
      'en': 'Get Started',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '4nz8uj1f': {
      'en': 'Create your account below.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'j6yspkt8': {
      'en': 'Full Name',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8w9oup7o': {
      'en': 'Enter your full name',
      'ar': 'الاسم الكامل',
      'bn': 'পুরো নাম',
      'fr': 'Nom et prénom',
    },
    '13jinqv9': {
      'en': 'Email',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'zytojq89': {
      'en': 'Enter a valid email',
      'ar': 'بريد إلكتروني',
      'bn': 'ইমেইল',
      'fr': 'E-mail',
    },
    '0glmtxhh': {
      'en': 'Password',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    's1y7k5vd': {
      'en': 'Choose a strong password!',
      'ar': 'كلمة المرور',
      'bn': 'পাসওয়ার্ড',
      'fr': 'Mot de passe',
    },
    '0vuldn5o': {
      'en': 'Re-enter Password',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'uqsqotky': {
      'en': 'Please re-enter password ',
      'ar': 'تأكيد كلمة المرور',
      'bn': 'পাসওয়ার্ড নিশ্চিত করুন',
      'fr': 'Confirmez le mot de passe',
    },
    'kgv2diry': {
      'en': 'Create Account',
      'ar': 'اشتراك',
      'bn': 'নিবন্ধন করুন',
      'fr': 'S\'inscrire',
    },
    'em5ydhq3': {
      'en': 'Login',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8j5w1kn3': {
      'en': 'Already have an account?',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'dlsxjhjh': {
      'en': 'Home',
      'ar': '',
      'bn': 'হোম',
      'fr': '',
    },
  },
  // AddTransactionType
  {
    'x2ug5scv': {
      'en': 'Income',
      'ar': 'دخل',
      'bn': 'আয়',
      'fr': 'Revenu',
    },
    'a2h6tkq2': {
      'en': 'Expense',
      'ar': 'مصروف',
      'bn': 'ব্যয়',
      'fr': 'Frais',
    },
    'ebj390s4': {
      'en': 'Category',
      'ar': 'فئة',
      'bn': 'শ্রেণী',
      'fr': 'Catégorie',
    },
    'avf8btm7': {
      'en': 'Budget',
      'ar': 'مدخرات',
      'bn': 'সঞ্চয়',
      'fr': 'Des économies',
    },
    'is9hpu9a': {
      'en': 'What you want to add?',
      'ar': 'ماذا تريد ان تضيف؟',
      'bn': 'আপনি কি যোগ করতে চান?',
      'fr': 'Que voulez-vous ajouter ?',
    },
    'yhy2ufua': {
      'en': 'Add',
      'ar': 'يضيف',
      'bn': 'যোগ করুন',
      'fr': 'Ajouter',
    },
  },
  // IncomeInput
  {
    'msqx7z1e': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'bn': 'বিকল্প 1',
      'fr': 'Option 1',
    },
    'u27hktnm': {
      'en': 'Category',
      'ar': 'فئة',
      'bn': 'শ্রেণী',
      'fr': 'Catégorie',
    },
    'b2nu327i': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'fr': 'Rechercher un article...',
    },
    'be2g6xhs': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'bn': 'বিকল্প 1',
      'fr': 'Option 1',
    },
    'd69rwc1j': {
      'en': 'Budget',
      'ar': 'فئة',
      'bn': 'শ্রেণী',
      'fr': 'Catégorie',
    },
    'xo5sr12w': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'fr': 'Rechercher un article...',
    },
    '3bb0zwo9': {
      'en': 'Amount',
      'ar': 'كمية',
      'bn': 'পরিমাণ',
      'fr': 'Montant',
    },
    'jvk6se57': {
      'en': 'Description',
      'ar': 'وصف',
      'bn': 'বর্ণনা',
      'fr': 'Description',
    },
    '96k7qamc': {
      'en': 'Add',
      'ar': 'يضيف',
      'bn': 'যোগ করুন',
      'fr': 'Ajouter',
    },
    'gc95pemp': {
      'en': 'Income Input',
      'ar': 'مدخلات الدخل',
      'bn': 'আয় ইনপুট',
      'fr': 'Entrée de revenu',
    },
    'u5afrglh': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // ExpenseInput
  {
    'jwx5drgj': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'bn': 'বিকল্প 1',
      'fr': 'Option 1',
    },
    'ey4ia22i': {
      'en': 'Category',
      'ar': 'فئة',
      'bn': 'শ্রেণী',
      'fr': 'Catégorie',
    },
    '5driknyy': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'fr': 'Rechercher un article...',
    },
    '0yyjx1x5': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'bn': 'বিকল্প 1',
      'fr': 'Option 1',
    },
    '3acjlwyz': {
      'en': 'Budget',
      'ar': 'فئة',
      'bn': 'শ্রেণী',
      'fr': 'Catégorie',
    },
    'a4kc6rd9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'fr': 'Rechercher un article...',
    },
    '2opp6oaw': {
      'en': 'Amount',
      'ar': 'كمية',
      'bn': 'পরিমাণ',
      'fr': 'Montant',
    },
    'ywg7pp5o': {
      'en': 'Note',
      'ar': 'ملحوظة',
      'bn': 'বিঃদ্রঃ',
      'fr': 'Note',
    },
    '27x5vr2h': {
      'en': 'Add',
      'ar': 'يضيف',
      'bn': 'যোগ করুন',
      'fr': 'Ajouter',
    },
    '5720ahku': {
      'en': 'Expense Input',
      'ar': 'مدخلات المصاريف',
      'bn': 'খরচ ইনপুট',
      'fr': 'Saisie des dépenses',
    },
    'oaaaecmr': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // CategoryInput
  {
    '35adgcay': {
      'en': 'Category Name',
      'ar': 'اسم التصنيف',
      'bn': 'বিভাগ নাম',
      'fr': 'Nom de catégorie',
    },
    'gbhio4xk': {
      'en': 'Add',
      'ar': 'يضيف',
      'bn': 'যোগ করুন',
      'fr': 'Ajouter',
    },
    'y22syfuh': {
      'en': 'Add Category',
      'ar': 'إضافة فئة',
      'bn': 'বিভাগ যোগ করুন',
      'fr': 'ajouter une catégorie',
    },
    'ak4e72pa': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // AppSettingsOLD
  {
    'shdp1dzt': {
      'en': 'App Settings',
      'ar': 'إعدادات التطبيقات',
      'bn': 'অ্যাপ সেটিংস',
      'fr': 'Paramètres de l\'application',
    },
    '3jmzqn1t': {
      'en': 'Theme',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'l35aokbe': {
      'en': 'Dark',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '2u5j04rb': {
      'en': 'Light',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'e10swkb7': {
      'en': 'Device Theme',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'niz87tb6': {
      'en': 'Device Theme',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'kg0b0xt7': {
      'en': 'Search for an item...',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'grbo703p': {
      'en': 'Currency',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '51m3clv0': {
      'en': 'Bangladeshi Taka - BDT (৳)',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'h93v49t7': {
      'en': 'United States Dollar - USD (\$)',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'lar6zuby': {
      'en': 'Bangladeshi Taka - BDT (৳)',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '5vwpbpfk': {
      'en': 'Search for an item...',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '56qgsdy1': {
      'en': 'Settings ',
      'ar': 'إعدادات',
      'bn': 'সেটিংস',
      'fr': 'Paramètres',
    },
  },
  // AddTransactionImage
  {
    'noj74amd': {
      'en': 'Attachment',
      'ar': 'مرفق',
      'bn': 'সংযুক্তি',
      'fr': 'Pièce jointe',
    },
    '40ks0yvp': {
      'en': 'Add Image',
      'ar': 'تصنيف المعاملة',
      'bn': 'লেনদেন শ্রেণীবদ্ধ করুন',
      'fr': 'Catégoriser la transaction',
    },
    '8il0ipml': {
      'en': 'Transaction Image',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'ol9p5cu7': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // TransactionDetails
  {
    '2fhn5mti': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'zbfgxnbm': {
      'en': 'Statistics',
      'ar': 'إحصائيات',
      'bn': 'পরিসংখ্যান',
      'fr': 'Statistiques',
    },
  },
  // EditProfile
  {
    '84gby97a': {
      'en': 'Name',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '9to5323f': {
      'en': 'Name',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'j0kps126': {
      'en': 'Email',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'rhjsmdli': {
      'en': 'Email',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'no4619md': {
      'en': 'Save Changes',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ndcpd8wm': {
      'en': 'Reset Password',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ir3i6g8f': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'bn': 'জীবন বৃত্তান্ত সম্পাদনা',
      'fr': 'Editer le profil',
    },
  },
  // ZakatCalculator
  {
    'xlycbnwx': {
      'en': 'Cash Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'r4n6n7wh': {
      'en': 'Hand Cash',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'l4qv1adz': {
      'en': 'Cash on Hand',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'z7ouyqbh': {
      'en': 'Bank Cash',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8aonlh6w': {
      'en': 'Cash in Bank',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'h5xwetnq': {
      'en': 'Equivalent amount of Metals',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'eubynrab': {
      'en': 'Gold Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'd3tum4xy': {
      'en': 'Amount of Gold in gram',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '6vtiw9gf': {
      'en': 'Silver Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '31wsr32k': {
      'en': 'Amount of Silver in gram',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'hia640fy': {
      'en':
          'You would need to be online in order to calculate the current prices for gold and silver. \nYou won\'t obtain a current price unless.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'o3g0bbp1': {
      'en': 'Calculate Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'qp25oz8n': {
      'en': 'Zakat Calculator',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    's4kjvuy1': {
      'en': 'Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // Zakat
  {
    'bq4yc4se': {
      'en': 'Calculate Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'z7g4l8fh': {
      'en': 'Donate Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'yekgp02m': {
      'en': 'What is Zakat?',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'enwgv9f8': {
      'en':
          'Zakat is one of the five pillars of Islam, which refers to the obligatory charity or alms-giving that Muslims are required to give to the needy.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ee8bmk8x': {
      'en':
          'Zakat is one of the five pillars of Islam, which refers to the obligatory charity or alms-giving that Muslims are required to give to the needy. It is a specific amount or percentage of a Muslim\'s wealth that must be donated to the poor and needy, such as orphans, widows, the disabled, and others who are less fortunate.\n\nThe exact amount of Zakat that must be given is determined by Islamic law and is usually around 2.5% of a Muslim\'s total wealth, including assets such as gold, silver, cash, and property. The payment of Zakat is not only a religious obligation but also a means of purifying one\'s wealth and achieving greater spiritual rewards in the eyes of Allah. It is typically given during the month of Ramadan, although it can be given at any time of the year.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'f5jv5zzq': {
      'en': 'Conditions for Zakat being Far\'z',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'y6afgksr': {
      'en': 'Zakat is obligatory on someone who is:',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '3zrvnmmc': {
      'en':
          'Zakat is obligatory on someone who is:\n\n1. A free man or woman: A slave does not have to pay zakat.\n\n2. A Muslim. Zakat is a religious obligation upon Muslims, like the five daily prayers.\n\n3. Sane: The person on whom zakat becomes obligatory must be of sound mind according to Imam Abu Hanifa. Imam Malik holds that an insane person is still liable for zakat.\n\n4. An adult: Children do not have to pay zakat, even if they own enough wealth to make zakat obligatory. However, both Imam Shafi’i and Imam Malik say that the guardians of the children should pay the zakat on their behalf.\n\n5. In complete ownership and control of their wealth: The person must own and be in possession of the wealth, and also be free to spend or dispose of the wealth in any manner they like. If a person has made a loan of their wealth then they are not in a position to spend it until it is repaid.\n\n6. In possession of wealth above the nisab threshold: The person should possess wealth above a defined amount required to satisfy the essential needs of themselves and their dependents (nisab).\n\n7. Free from debt: Someone in debt may deduct his debts from his assets, if what remains is still above the nisab threshold, zakat is due, otherwise not.\n\n8. In possession of the wealth for one complete lunar (Hijrah) year: If one owns zakatable wealth for a lunar year, zakat will become obligatory, provided the total amount of wealth exceeds the nisab at the beginning of the year and the end, irrespective of any fluctuations in the months between.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'yq8zsz1u': {
      'en': 'Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'rwi0h689': {
      'en': 'Home',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // AboutUs
  {
    'xqn24axl': {
      'en': 'Md. Rafiur Rahman',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'rs5e27ed': {
      'en': 'Frontend Developer ',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '1dpwnlen': {
      'en':
          'Software Engineering (SWE),\nDepartment of Computer Science and Engineering (CSE),\nIslamic University of Technology (IUT),\nGazipur, Dhaka, Bangladesh.\n\nhttps://github.com/rr-uchchash360',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'vlko04k4': {
      'en': 'Zubayer Tahmid',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'j3rmxu3k': {
      'en': 'Backend Developer ',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'au86jlmi': {
      'en':
          'Software Engineering (SWE),\nDepartment of Computer Science and Engineering (CSE),\nIslamic University of Technology (IUT),\nGazipur, Dhaka, Bangladesh.\n\nhttps://github.com/zubayertahmid',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'qr7gkcmp': {
      'en': 'Abrar Mahabub Nowrid',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'n3crawey': {
      'en': 'Backend Developer ',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'h9clkqtq': {
      'en':
          'Software Engineering (SWE),\nDepartment of Computer Science and Engineering (CSE),\nIslamic University of Technology (IUT),\nGazipur, Dhaka, Bangladesh.\n\nhttps://github.com/AbrarMahabub21',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '9t673cam': {
      'en': 'About Us',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8wy5k1g0': {
      'en': 'Home',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // BudgetInput
  {
    'vjhfy8eq': {
      'en': 'Amount',
      'ar': 'كمية',
      'bn': 'পরিমাণ',
      'fr': 'Montant',
    },
    'ejgnz51f': {
      'en': 'Budget Name',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'fra439b6': {
      'en': 'Budget Name',
      'ar': 'كمية',
      'bn': 'পরিমাণ',
      'fr': 'Montant',
    },
    'iy2mo1wo': {
      'en': 'Description',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '352410qe': {
      'en': 'You can write your budget details here.',
      'ar': 'وصف',
      'bn': 'বর্ণনা',
      'fr': 'Description',
    },
    'hg6kznnb': {
      'en': 'Budget Input',
      'ar': 'مدخلات الدخل',
      'bn': 'আয় ইনপুট',
      'fr': 'Entrée de revenu',
    },
    'w46wnyov': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // BudgetLists
  {
    'a8j9blof': {
      'en': 'Add Budget',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '16aujeyj': {
      'en': 'Search your budgets from here...',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '1m1js3c5': {
      'en': 'Recent Budgets',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '59u60lwd': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'klp579l9': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'xkfubo9a': {
      'en': '৳5000',
      'ar': '5000 ين ياباني',
      'bn': '৳5000',
      'fr': '৳5000',
    },
    'tik0oy4m': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'b7nrguf5': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'icsnoy6n': {
      'en': '৳1000',
      'ar': '1000 ين',
      'bn': '৳1000',
      'fr': '৳1000',
    },
    'wsf1tkho': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'dawrub09': {
      'en': 'Budget List',
      'ar': 'إضافة فئة',
      'bn': 'বিভাগ যোগ করুন',
      'fr': 'ajouter une catégorie',
    },
    'o82l44j9': {
      'en': 'Budget',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // BudgetDetails
  {
    '5xtgwb2p': {
      'en': 'Top Spending Categories',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'xoex607t': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    '6wdcxitt': {
      'en': 'Transaction Details',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'e49dd1rd': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'i5s2ls0c': {
      'en': '৳5000',
      'ar': '5000 ين ياباني',
      'bn': '৳5000',
      'fr': '৳5000',
    },
    'ae8f5rkl': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    '6jw6mdl7': {
      'en': 'Delete',
      'ar': '',
      'bn': 'মুছে ফেলুন',
      'fr': '',
    },
    'qq6v5x9r': {
      'en': '৳1000',
      'ar': '1000 ين',
      'bn': '৳1000',
      'fr': '৳1000',
    },
    'izgrxx7e': {
      'en': 'Transaction Details',
      'ar': 'تفاصيل الصفقه',
      'bn': 'লেনদেন বিবরণী',
      'fr': 'détails de la transaction',
    },
    'u5oi47jy': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'fr': 'Maison',
    },
  },
  // ZakatOutput
  {
    'g1zrna4v': {
      'en': 'Total Zakat in ৳',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'f2bomhz3': {
      'en':
          '“And establish prayer and give Zakat, and whatever good you put forward for yourselves,\nyou will find it with Allah.”\n[2:110, Qur\'an]',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8g1qmcy1': {
      'en': 'Try to pay you Zakat as soon as possible.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'hfkpfvt5': {
      'en': 'Donate Zakat',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '7ba1hruh': {
      'en': 'Zakat Output',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'mah3cpgj': {
      'en': 'Home',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // Menu
  {
    'wypsjoxv': {
      'en': 'Edit Profile',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'oau5sjt0': {
      'en': 'Zakat Section',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'tao6yiof': {
      'en': 'About Us',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'dee3ycu4': {
      'en': 'App Settings',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'lapkunte': {
      'en': 'Logout',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'bj75qqy3': {
      'en': 'Build Number : 1.05.22.2023',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'apu86q6o': {
      'en': 'Menu',
      'ar': 'رسم بياني',
      'bn': 'চিত্রলেখ',
      'fr': 'Graphique',
    },
    '0hdjntt2': {
      'en': 'Menu',
      'ar': 'إحصائيات',
      'bn': 'পরিসংখ্যান',
      'fr': 'Statistiques',
    },
  },
  // ZakatDonation
  {
    'zmjd3yif': {
      'en': 'As Sunnah Foundation',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'nsd46frl': {
      'en': 'Ahsania Mission Bangladesh',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '8w4f09ig': {
      'en': 'UCEP, Bangladesh',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'y95skgxk': {
      'en': 'Zakat Donation',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'semwhvn7': {
      'en': 'Home',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // AppSettings
  {
    'zc7su4nv': {
      'en':
          'Choose what notifications you want to receive below and we will update the settings.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ar4m5768': {
      'en': 'Push Notifications',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'khetakgt': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ekzukcte': {
      'en': 'Email Notifications',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'hcc7xxou': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '7nceyf2b': {
      'en': 'Save Changes',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'tlpt0i6k': {
      'en': 'App Settings',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // Graph
  {
    'ao6zi6h2': {
      'en': 'Date',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'rmaqk5wo': {
      'en': 'Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '5u51i665': {
      'en': 'Type',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'p353c8aw': {
      'en': 'Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'ar930xzq': {
      'en': 'Graph',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'u1ocdmch': {
      'en': 'Graph',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // GraphCopy
  {
    'ivmzmxlr': {
      'en': 'Date',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'jqzgyrw6': {
      'en': 'Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'j1i0xb82': {
      'en': 'Type',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '5dtk82zm': {
      'en': 'Amount',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'iefhngaw': {
      'en': 'Graph',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '4iqpz7zs': {
      'en': 'Graph',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // budgetButtonAdd
  {
    'a8u19wd8': {
      'en': 'Create Budget',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'rkygjjct': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '9rnnro63': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'x5sp5ubf': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'v0kvq1vk': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    's9jpqbeh': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'yq8pl6yo': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'zd9mtfxm': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'evo6dvnw': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'zxykyni5': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '7vtvg5zu': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'mepdzebg': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'cu96eecl': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '71xofebu': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'sxmajx3m': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'aagq0i0g': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '82k3pxfc': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'pxkv11xz': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '32gtrjfb': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '9wbn0t5k': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'w9gyhcfz': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'd8738uy2': {
      'en': '',
      'ar': '',
      'bn': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
