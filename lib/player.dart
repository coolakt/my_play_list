import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  List songs = [
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/1.mp3",
      "name": "Ankhiya Udeek dia!",
      "movie": "Shidath",
      "genera": "Heart Break"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/2.mp3",
      "name": "Arjan Vailly!",
      "movie": "Animal",
      "genera": "Motivation"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/3.mp3",
      "name": "Saari Duniya",
      "movie": "Animal",
      "genera": "Emotion"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/4.mp3",
      "name": "Satranga",
      "movie": "Animal",
      "genera": "Romance"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/5.mp3",
      "name": "Barbadiya",
      "movie": "Shidat",
      "genera": "Party"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/6.mp3",
      "name": "Chal tere ishq main",
      "movie": "Gaddar 2",
      "genera": "Romance"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/7.mp3",
      "name": "Kar Har Maidan Fateh",
      "movie": "Sanju",
      "genera": "Motivation"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/8.mp3",
      "name": "Shiddat",
      "movie": "Shidath",
      "genera": "Romance"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/9.mp3",
      "name": "Tum Kya Mila",
      "movie": "Rockey aur Rani",
      "genera": "Romance"
    },
    {
      "thumbnail":
      "https://e7.pngegg.com/pngimages/779/964/png-clipart-google-play-music-media-player-mp3-player-music-material-miscellaneous-album-thumbnail.png",
      "path": "music/10.mp3",
      "name": "Ve Kamleya",
      "movie": "Rockey aur Rani",
      "genera": "Romance"
    },
  ];

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration positon = Duration.zero;
  Duration duration = Duration.zero;
  var i;

  @override
  void initState() {
    super.initState();
    // Initialize and set up player when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final routes = ModalRoute.of(context)?.settings.arguments as Map<String, int>;
      i = routes?["index"];
      if (i != null) {
        await setAudio();
      }
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      setState(() {
        isPlaying = playerState == PlayerState.playing;
      });
    });

    audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        positon = position;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
  }

  Future setAudio() async {
    if (i != null) {
      await audioPlayer.play(AssetSource(songs[i]["path"]));
    }
  }

  // Stop audio when navigating back
  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.black87,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipOval(
                  child: Image.network(
                    songs[i ?? 0]["thumbnail"],
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.music_note, size: 100),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: positon.inSeconds.toDouble(),
                onChanged: (value) async {
                  final newPosition = Duration(seconds: value.toInt());
                  await audioPlayer.seek(newPosition);
                  setState(() {
                    positon = newPosition;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
