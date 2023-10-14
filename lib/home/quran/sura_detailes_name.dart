import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArg;
    if (verses.isEmpty) {
      LoadFile(args.index);
    }

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
              title: Text('${args.name}',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body: verses.length == 0
                ? Center(child: CircularProgressIndicator())
                : Container(
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06,
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: provider.isDarkMode()
                            ? Theme.of(context).primaryColor
                            : MyTheme.whitecolor,
                        borderRadius: BorderRadius.circular(24)),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: provider.isDarkMode()
                              ? MyTheme.whitecolor
                              : Theme.of(context).primaryColor,
                          thickness: 2,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ItemSuraDetails(
                          content: verses[index],
                          index: index,
                        );
                      },
                      itemCount: verses.length,
                    ),
                  )),
      ],
    );
  }

  void LoadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArg {
  String name;
  int index;

  SuraDetailsArg({required this.name, required this.index});
}
