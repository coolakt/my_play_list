import 'package:flutter/material.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Music List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 5),
        color: Colors.black87,
        child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 236, 167, 190),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: Image.network(
                          songs[index]["thumbnail"],
                          width: 50,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              songs[index]["name"],
                              style: const TextStyle(
                                  color: Colors.pink, fontSize: 20),
                            ),
                            Text(
                              songs[index]["movie"],
                              style: const TextStyle(color: Colors.pink),
                            )
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 242, 196, 211),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/player",
                              arguments: {'index': index});
                        },
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
