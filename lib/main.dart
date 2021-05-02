import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/localization/app_localization.dart';
import 'package:tutorial/provider/auth_provider.dart';
import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/provider/splash_provider.dart';
import 'package:tutorial/provider/theme_provider.dart';
import 'package:tutorial/theme/dark_theme.dart';
import 'package:tutorial/theme/light_theme.dart';
import 'package:tutorial/util/app_constant.dart';
import 'package:tutorial/view/screen/splash/splash_screen.dart';

import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  //await NotificationsHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstant.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });
    return MaterialApp(
      title: 'Bepza MIS',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: _locals,
      home: SplashScreen(),
    );
  }
}
