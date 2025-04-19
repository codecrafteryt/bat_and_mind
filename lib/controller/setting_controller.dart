/*
          ---------------------------------------
          Project: Bat and Brain Game Mobile Application
          Date: April 4, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: Quiz screen
        */
import 'package:audioplayers/audioplayers.dart' show AssetSource, AudioPlayer, PlayerMode, ReleaseMode;
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SharedPreferences sharedPreferences;
  SettingController({required this.sharedPreferences});

  // Audio players
  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  final AudioPlayer _soundEffectsPlayer = AudioPlayer();

  // SharedPreferences keys
  static const String _musicKey = 'music_enabled';
  static const String _soundKey = 'sound_enabled';
  static const String _musicVolumeKey = 'music_volume';
  static const String _soundVolumeKey = 'sound_volume';

  // Observables with saved state
  late RxBool isMusicOn;
  late RxBool isSoundOn;
  late RxDouble musicVolume;
  late RxDouble soundVolume;

  // Getters for audio players
  AudioPlayer get backgroundMusicPlayer => _backgroundMusicPlayer;
  AudioPlayer get soundEffectsPlayer => _soundEffectsPlayer;

  void _setupAudio() async {
    try {
      // Setup background music
      await _setupBackgroundMusic();
      // Setup sound effects
      await _setupSoundEffects();
    } catch (e) {
      debugPrint('Error setting up audio: $e');
    }
  }

  Future<void> _setupBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await _backgroundMusicPlayer.setPlayerMode(PlayerMode.mediaPlayer);

      await _backgroundMusicPlayer
          .setSourceAsset('audio/music.wav')
          .timeout(const Duration(seconds: 5));

      await _backgroundMusicPlayer.setVolume(musicVolume.value);

      if (isMusicOn.value) {
        await _backgroundMusicPlayer.resume();
        debugPrint('🎵 Background music started at volume: ${(musicVolume.value * 100).toInt()}%');
      }
    } catch (e) {
      debugPrint('Error setting up background music: $e');
    }
  }


  Future<void> _setupSoundEffects() async {
    try {
      await _soundEffectsPlayer.setReleaseMode(ReleaseMode.loop);
      await _soundEffectsPlayer.setPlayerMode(PlayerMode.lowLatency);
      await _soundEffectsPlayer.setVolume(soundVolume.value);

      if (isSoundOn.value) {
        await _soundEffectsPlayer
            .play(AssetSource('audio/sound.wav'))
            .timeout(const Duration(seconds: 5));
        debugPrint('🔁 Sound effect started in loop at volume: ${(soundVolume.value * 100).toInt()}%');
      }
    } catch (e) {
      debugPrint('Error setting up looping sound effect: $e');
    }
  }




  void toggleMusic() {
    isMusicOn.value = !isMusicOn.value;
    sharedPreferences.setBool(_musicKey, isMusicOn.value);

    if (isMusicOn.value) {
      _backgroundMusicPlayer.resume();
      debugPrint('🎵 Music turned ON, volume: ${(musicVolume.value * 100).toInt()}%');
    } else {
      _backgroundMusicPlayer.pause();
      debugPrint('🎵 Music turned OFF');
    }
  }

  void toggleSound() {
    isSoundOn.value = !isSoundOn.value;
    sharedPreferences.setBool(_soundKey, isSoundOn.value);

    if (isSoundOn.value) {
      _soundEffectsPlayer.setReleaseMode(ReleaseMode.loop); // ensure loop mode
      _soundEffectsPlayer.play(AssetSource('audio/sound.wav'));
      debugPrint('🔊 Sound turned ON, looping...');
    } else {
      _soundEffectsPlayer.stop();
      debugPrint('🔊 Sound turned OFF');
    }
  }

  void setMusicVolume(double value) {
    musicVolume.value = value;
    sharedPreferences.setDouble(_musicVolumeKey, value);
    _backgroundMusicPlayer.setVolume(value);

    // Only update play state if already enabled
    if (isMusicOn.value) {
      _backgroundMusicPlayer.resume();
    }

    debugPrint('🔊 setMusicVolume: ${(value * 100).toInt()}%');
  }

  void setSoundVolume(double value) {
    soundVolume.value = value;
    sharedPreferences.setDouble(_soundVolumeKey, value);
    _soundEffectsPlayer.setVolume(value);

    // Only play test sound if sound is enabled
    if (isSoundOn.value) {
      _soundEffectsPlayer.play(AssetSource('audio/sound.wav'));
    }

    debugPrint('🔊 setSoundVolume: ${(value * 100).toInt()}%');
  }


  @override
  void onInit() {
    super.onInit();

    // Load saved settings with reasonable defaults
    isMusicOn = RxBool(sharedPreferences.getBool(_musicKey) ?? false);
    isSoundOn = RxBool(sharedPreferences.getBool(_soundKey) ?? false);
    musicVolume = RxDouble(sharedPreferences.getDouble(_musicVolumeKey) ?? 0.7);
    soundVolume = RxDouble(sharedPreferences.getDouble(_soundVolumeKey) ?? 0.4);

    debugPrint('Settings initialized:');
    debugPrint('- Music: ${isMusicOn.value ? "ON" : "OFF"} (${(musicVolume.value * 100).toInt()}%)');
    debugPrint('- Sound: ${isSoundOn.value ? "ON" : "OFF"} (${(soundVolume.value * 100).toInt()}%)');

    // Use Future.delayed to prevent immediate async calls in onInit
    Future.delayed(Duration.zero, () {
      _setupAudio();
    });
  }

  @override
  void onClose() {
    _backgroundMusicPlayer.dispose();
    _soundEffectsPlayer.dispose();
    super.onClose();
  }
}