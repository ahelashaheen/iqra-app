import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class LanguageThemeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? getSelectedItemWidget(
                    context, AppLocalizations.of(context)!.app_title) //dark
                : getUnSelectedItemWidget(
                    context, AppLocalizations.of(context)!.app_title) //dark
            ),
        InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? getSelectedItemWidget(
                    context, AppLocalizations.of(context)!.sura_name) //light
                : getUnSelectedItemWidget(
                    context, AppLocalizations.of(context)!.sura_name) //light
            )
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
            size: 35,
          )
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleMedium),
          // Icon(Icons.check, color: Theme.of(context).primaryColor,size: 35,)
        ],
      ),
    );
  }
}
