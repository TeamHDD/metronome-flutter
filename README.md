# Metronome

[![pub package](https://img.shields.io/pub/v/metronome.svg)](https://pub.dev/packages/metronome)

Efficient, accurate, cross-platform metronome; supports volume, BPM, and audio source settings.
##

![Metronome](https://raw.githubusercontent.com/biner88/metronome/main/screenshot/home1.png)

## TODO

* [ ] Add CallBack function on Tick
* [ ] Add MacOS support
* [ ] Add Windows support
* [x] Add getBMP() function
* [x] Fix IOS getVolume()
* [x] Change volume type (double to int)
* [x] Change bpm type (double to int)

## Quick Start 

### Init

```dart
final metronome = Metronome();
metronome.init('assets/audio/snare.wav', bpm: 120, volume: 50);
```

### Play

```dart
metronome.play();
```

### Pause

```dart
metronome.pause();
```

### Stop

```dart
metronome.stop();
```

### Volume

```dart
metronome.getVolume();
metronome.setVolume(50);
```

### BPM

```dart
metronome.setBPM(120); 
metronome.getBPM(); 
```

### get Play state

```dart
metronome.isPlaying();
```

### setAudioFile

```dart
metronome.setAudioFile('assets/audio/snare.wav');
```

### destroy

```dart
metronome.destroy();
```

### Tap callback

```
metronome.onListenTap((_) {
  if (kDebugMode) {
    print('tap');
  }
});
```

## About Web

Please add the `example/web/app.js` file to index.html under your web. As follows:

```html
<script src="app.js" defer></script>
```
