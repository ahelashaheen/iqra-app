import 'package:flutter/material.dart';
import 'package:islami_app/home/ahadeth/ahadeth_details_screen.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import 'ahadeth_tab.dart';

class ItemAhadethName extends StatelessWidget {
  Ahadeth ahadeth;

  ItemAhadethName({required this.ahadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AhadethDetails.routeName, arguments: ahadeth);
      },
      child: Text(
        ahadeth.title,
        style: provider.isDarkMode()
            ? Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.whitecolor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
