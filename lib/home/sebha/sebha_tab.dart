import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> tasbehat = [
    'سبحان الله',
    'الله اكبر',
    'الحمد الله',
    'لا اله الا الله',
    'لا حول ولا قوة الا بالله',
    'سبحان الله وبحمده سبحان الله العظيم',
    'اللهم صل وسلم على نبينا محمد',
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/head_of_seb7a.png'),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  child: GestureDetector(
                      onTap: OnTap,
                      child: Transform.rotate(
                          angle: angle,
                          child:
                              Image.asset('assets/images/body_of_seb7a.png')))),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
                color: provider.isDarkMode()
                    ? MyTheme.whitecolor
                    : Theme.of(context).shadowColor,
                fontSize: 25,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.PrimaryDark
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(23)),
            padding: EdgeInsets.all(20),
            child: Text(
              '$counter',
              style: TextStyle(
                  color: provider.isDarkMode()
                      ? MyTheme.whitecolor
                      : Theme.of(context).shadowColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.yellowcolor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(23)),
            padding: EdgeInsets.all(15),
            child: Text(
              tasbehat[index],
              style: TextStyle(
                  color: provider.isDarkMode()
                      ? MyTheme.blackcolor
                      : Theme.of(context).canvasColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void OnTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbehat.length) {
      index = 0;
    }
    angle += 360 / 33;
    setState(() {});
  }
}
