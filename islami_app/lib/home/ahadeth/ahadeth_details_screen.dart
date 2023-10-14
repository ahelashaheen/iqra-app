import 'package:flutter/material.dart';
import 'package:islami_app/home/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/home/ahadeth/item_ahadeth_detales.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = 'AhadethDetails';

  @override
  State<AhadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Ahadeth;

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
              title: Text('${args.title}',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body: Container(
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemAhadethDetails(
                    content: args.content[index],
                  );
                },
                itemCount: args.content.length,
              ),
            )),
      ],
    );
  }
}
