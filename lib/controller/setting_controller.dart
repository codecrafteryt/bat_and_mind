import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class SettingController extends GetxController {
  final SharedPreferences sharedPreferences;
  SettingController({required this.sharedPreferences,});

  // Audio players
  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  final AudioPlayer _soundEffectsPlayer = AudioPlayer();


  // SharedPreferences keys
  static const String _musicKey = 'music_enabled';
  static const String _soundKey = 'sound_enabled';

  // Observables with saved state
  late RxBool isMusicOn;
  late RxBool isSoundOn;
  RxDouble volume = 0.5.obs;


  // Getters for audio players
  AudioPlayer get backgroundMusicPlayer => _backgroundMusicPlayer;
  AudioPlayer get soundEffectsPlayer => _soundEffectsPlayer;


  void _setupAudio() async {
    try { // Setup background music
      await _setupBackgroundMusic();
      await _setupSoundEffects(); // Setup sound effects
    } catch (e) {
      debugPrint('Error setting up audio: $e');
    }
  }

  Future<void> _setupBackgroundMusic() async {
    try { // Configure audio to continue playing in background
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await _backgroundMusicPlayer.setPlayerMode(PlayerMode.mediaPlayer);
      await _backgroundMusicPlayer.setSourceAsset('audio/music.wav'); // Set the audio source
      if (isMusicOn.value) { // Start playing if music is enabled
        await _backgroundMusicPlayer.resume();
      }
    } catch (e) {
      debugPrint('Error setting up background music: $e');
    }
  }

  Future<void> _setupSoundEffects() async {
    try { // Configure sound effects
      await _soundEffectsPlayer.setReleaseMode(ReleaseMode.loop);
      await _soundEffectsPlayer.setPlayerMode(PlayerMode.mediaPlayer);
      await _soundEffectsPlayer.setSourceAsset('audio/sound.wav');  // Set the audio source for sound effects
      if (isSoundOn.value) { // Start playing if sound is enabled
        await _soundEffectsPlayer.resume();
      }
    } catch (e) {
      debugPrint('Error setting up sound effects: $e');
    }
  }

  void toggleMusic() {
    if (isSoundOn.value) { // If sound is on, turn it off first
      toggleSound();
    }
    isMusicOn.value = !isMusicOn.value; // Toggle music state
    sharedPreferences.setBool(_musicKey, isMusicOn.value); // Save to SharedPreferences
    if (isMusicOn.value) { // Control background music
      _backgroundMusicPlayer.resume();
    } else {
      _backgroundMusicPlayer.pause();
    }
  }

  void toggleSound() {
    if (isMusicOn.value) { // If music is on, turn it off first
      toggleMusic();
    }
    isSoundOn.value = !isSoundOn.value; // Toggle the sound state
    sharedPreferences.setBool(_soundKey, isSoundOn.value); // Save to SharedPreferences
    if (isSoundOn.value) { // Control sound effects
      _soundEffectsPlayer.resume();
    } else {
      _soundEffectsPlayer.pause();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved settings, default to false
    isMusicOn = RxBool(sharedPreferences.getBool(_musicKey) ?? false);
    isSoundOn = RxBool(sharedPreferences.getBool(_soundKey) ?? false);
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