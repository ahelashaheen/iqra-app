import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';
import 'package:islami_app/settings/setting_tab.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                'assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/icon_ahadeeth.png')),
                  label: AppLocalizations.of(context)!.ahadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.radio),
              ],
            ),
          ),
          body: tabs[selectedindex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    Settings()
  ];
}
