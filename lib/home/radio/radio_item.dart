import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radios;
import 'RadioResponse.dart';
import 'package:islami_app/my_theme.dart';

class RadioItem extends StatelessWidget {
  Radios radio;
  AudioPlayer audioplayer;

  RadioItem({required this.radio, required this.audioplayer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Column(
        children: [
          Text(radio.name ?? '',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => audioplayer.play(UrlSource(radio.url!))
                  , icon: Icon(Icons.play_arrow,
                color: MyTheme.PrimaryLight,
                size: 40,)),
              SizedBox(width: 28),
              IconButton(onPressed: audioplayer.stop
                  , icon: Icon(Icons.stop,
                    color: MyTheme.PrimaryLight,
                    size: 40,))
            ],
          )
        ],
      ),
    );
  }
}
