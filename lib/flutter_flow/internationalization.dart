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
    'll87do52': {
      'en': 'Email',
      'ar': '',
      'bn': 'ইমেইল',
      'fr': '',
    },
    'amy9qn3w': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'bn': 'পাসওয়ার্ড',
      'fr': 'Mot de passe',
    },
    'qrby8rf0': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
      'bn': 'প্রবেশ করুন',
      'fr': 'Connexion',
    },
    'tdj041cp': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'bn': 'একটি অ্যাকাউন্ট নেই?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'hgo4qe1u': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
      'bn': 'নিবন্ধন করুন',
      'fr': 'S\'inscrire',
    },
    '4sl8v9yy': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'bn': 'প্রবেশ করুন',
      'fr': 'Connexion',
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
    '8w9oup7o': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'bn': 'পুরো নাম',
      'fr': 'Nom et prénom',
    },
    'zytojq89': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'bn': 'ইমেইল',
      'fr': 'E-mail',
    },
    's1y7k5vd': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'bn': 'পাসওয়ার্ড',
      'fr': 'Mot de passe',
    },
    'uqsqotky': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'bn': 'পাসওয়ার্ড নিশ্চিত করুন',
      'fr': 'Confirmez le mot de passe',
    },
    'kgv2diry': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
      'bn': 'নিবন্ধন করুন',
      'fr': 'S\'inscrire',
    },
    'lh9u4ncy': {
      'en': 'Already  have an account?',
      'ar': 'هل لديك حساب؟',
      'bn': 'ইতিমধ্যে একটি সদস্যপদ আছে?',
      'fr': 'Vous avez déjà un compte?',
    },
    'xihdx5z1': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'bn': 'প্রবেশ করুন',
      'fr': 'Connexion',
    },
    '3v02emcd': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
      'bn': 'নিবন্ধন করুন',
      'fr': 'S\'inscrire',
    },
    'dlsxjhjh': {
      'en': 'Home',
      'ar': '',
      'bn': 'হোম',
      'fr': '',
    },
  },
  // Graph
  {
    '4iow2533': {
      'en': 'Graph',
      'ar': 'رسم بياني',
      'bn': 'চিত্রলেখ',
      'fr': 'Graphique',
    },
    'hnwhw8to': {
      'en': 'Statistics',
      'ar': 'إحصائيات',
      'bn': 'পরিসংখ্যান',
      'fr': 'Statistiques',
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
      'en': 'Savings',
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
    '1lqyriys': {
      'en': 'Add Image',
      'ar': 'إضافة صورة',
      'bn': 'ছবি যোগ কর',
      'fr': 'Ajouter une image',
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
  // AppSettings
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
  // Menu
  {
    'vloj7uyl': {
      'en': 'Menu',
      'ar': 'قائمة طعام',
      'bn': 'তালিকা',
      'fr': 'Menu',
    },
    '7c1bnopp': {
      'en': 'Edit Profile',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'tb6yhf1x': {
      'en': 'Zakat Section',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    'wfjq3fyh': {
      'en': 'About Us',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '295h3yrp': {
      'en': 'Logout',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '42mczdyj': {
      'en': 'Menu',
      'ar': 'قائمة طعام',
      'bn': 'তালিকা',
      'fr': 'Menu',
    },
  },
  // EditProfile
  {
    '96eks5bg': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'bn': 'ছবি পরিবর্তন',
      'fr': 'Changer la photo',
    },
    'pvrjsb9d': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'bn': 'তোমার নাম',
      'fr': 'votre nom',
    },
    'xtfepha5': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'bn': 'ইমেইল ঠিকানা',
      'fr': 'Adresse e-mail',
    },
    'pga5x5gs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'bn': 'পরিবর্তনগুলোর সংরক্ষন',
      'fr': 'Sauvegarder les modifications',
    },
    'tzgf8h6m': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'bn': 'জীবন বৃত্তান্ত সম্পাদনা',
      'fr': 'Editer le profil',
    },
  },
  // ZakatCalculator
  {
    '9ucma7xc': {
      'en': 'Cash Amount',
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
    'd3tum4xy': {
      'en': 'Equivalent amount of Gold',
      'ar': '',
      'bn': '',
      'fr': '',
    },
    '31wsr32k': {
      'en': 'Equivalent amount of Silver',
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
      'en': 'Home',
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
