
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class MusicPlayer {
  static AudioPlayer audioPlayer = AudioPlayer();
  static bool isVolumeOff = false;
  static Future<void> playMusic() async {
    try {
      await audioPlayer.play(AssetSource("audio/recieve.wav"));

    } catch (e) {
      rethrow;
    }
  }

  static  Future<void> playOver() async {
    try {
      await audioPlayer.play(AssetSource("audio/over.mp3"));

    } catch (e) {
      rethrow;
    }
  }
  static  Future<void> playMain() async {
    try {
      await audioPlayer.play(AssetSource("audio/main.mp3"));
    } catch (e) {
      rethrow;
    }
  }

static  Future<void> hurray() async {
    try {
      await audioPlayer.play(AssetSource("audio/hurray.mp3"));
    } catch (e) {
      rethrow;
    }
  }
static  Future<void> win() async {
    try {
      await audioPlayer.play(AssetSource("audio/win.mp3"));
    } catch (e) {
      rethrow;
    }
  }
static  Future<void> winn() async {
    try {
      await audioPlayer.play(AssetSource("audio/winn.mp3"));
    } catch (e) {
      rethrow;
    }
  }




  static Future<void> OnOFValume() async {
    try {
      // Check the current state of the audio player
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.pause();
        isVolumeOff = true;
      } else {
        await audioPlayer.resume();
        playMain();
        isVolumeOff = false;
      }
    } catch (e) {
      rethrow;
    }
  }

}