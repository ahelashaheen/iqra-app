import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/home/radio/radio_item.dart';
import 'package:islami_app/my_theme.dart';

import 'RadioResponse.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final audioplayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var radioes = snapshot.data?.radios ?? [];
          return Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/radio_image.png')),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemBuilder: (_, index) =>
                      RadioItem(
                          radio: radioes[index], audioplayer: audioplayer),
                  itemCount: radioes.length,
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Something Went Wrong'));
        } else {
          return Center(
            child: CircularProgressIndicator(color: MyTheme.PrimaryLight,),
          );
        }
      },
    );
  }

  Future<RadioResponse> getRadio() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } else {
      throw Exception('Failed to load Radioes');
    }
  }
}
