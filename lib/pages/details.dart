import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:movie/conests.dart';

class Details extends StatefulWidget {
  final String img;
  final String id;
  final String title;
  final String overview;
  const Details({
    Key? key,
    required this.img,
    required this.id,
    required this.title,
    required this.overview,
  }) : super(key: key);
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  YoutubePlayerController? youtupePlayerController;
  @override
  void initState() {
    youtupePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=${widget.id}')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: false,
        loop: true,
        mute: false,
        hideControls: true,
        disableDragSeek: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    youtupePlayerController!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    youtupePlayerController!.pause();

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Movie',
            style: TextStyle(color: fontcolor, fontSize: 25)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.img}'),
                    fit: BoxFit.fill)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primarycolor),
                    child: Column(children: [
                      const Text(
                        'Watch Trailer',
                        style: TextStyle(fontSize: 18, color: fontcolor),
                      ),
                      SizedBox(
                        width: size.width * 0.85,
                        child: YoutubePlayer(
                          controller: youtupePlayerController!,
                          onReady: () {
                            youtupePlayerController!.play();
                          },
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.title,
                      style: const TextStyle(
                          fontSize: 20,
                          color: fontcolor,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.overview,
                    style: const TextStyle(fontSize: 16, color: fontcolor),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            launch('https://egar.egybest.run/explore/?q=${widget.title}');
          },
          label: const Text(
            'Watch In Egybest',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: primarycolor.withOpacity(0.8)),
    );
  }
}
