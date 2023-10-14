import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/quran/sura_detailes_name.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/ahadeth/ahadeth_details_screen.dart';
import 'home/home-screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        AhadethDetails.routeName: (context) => AhadethDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyTheme.LightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
    );
  }
}
