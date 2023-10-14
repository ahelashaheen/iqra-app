import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import 'item_ahadeth_name.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Ahadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      LoadahadethFile();
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_logo.png')),
        Divider(
          color: provider.isDarkMode()
              ? MyTheme.yellowcolor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.ahadeth_name,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: provider.isDarkMode()
              ? MyTheme.yellowcolor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowcolor
                          : Theme.of(context).primaryColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemAhadethName(
                      ahadeth: ahadethList[index],
                    );
                  },
                  itemCount: ahadethList.length,
                ),
              )
      ],
    );
  }

  void LoadahadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> ahadethLines = ahadethList[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      Ahadeth ahadeth = Ahadeth(title: title, content: ahadethLines);
      ahadethList.add(ahadeth as String);
      setState(() {});
    }
  }
}

class Ahadeth {
  String title;
  List<String> content;

  Ahadeth({required this.title, required this.content});
}
