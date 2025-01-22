import 'package:flutter/material.dart';


class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({Key? key, required this.audioUrl}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
          onPressed: () {
            setState(() {
              isPlaying = !isPlaying;
            });
            // Implement play/pause functionality for the audio
          },
        ),
        Text(isPlaying ? 'Playing' : 'Paused'),
      ],
    );
  }
}
