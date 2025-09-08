import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const SecretListenerApp());
}

class SecretListenerApp extends StatelessWidget {
  const SecretListenerApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark)),
      home: const SecretListenerHomepage(),
    );
  }
}

class SecretListenerHomepage extends StatefulWidget {
  const SecretListenerHomepage({super.key});

  @override
  State<SecretListenerHomepage> createState() => _SecretListenerHomepageState();
}

class _SecretListenerHomepageState extends State<SecretListenerHomepage> {
   FilePickerResult? result;
   AudioPlayer audioPlayer = AudioPlayer();
   double playbackRate = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secret Listener'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/whatsapp.png',
              height: 300,
                    ),
               result == null 
               ? const Text('Scegli un vocale') 
               : Text(result!.files.single.name),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   IconButton(
                    onPressed: playAudio, 
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 100,
                    ),
                   ElevatedButton(
                    onPressed: togglePlaybackRate, 
                    child: Text('X$playbackRate')),
                 ],
               )
            ],
          ),
        ),
       floatingActionButton: FloatingActionButton(
        onPressed: pickFile,
        child: const Icon(Icons.audio_file)
        ),
    );
  }
  
  void pickFile() async {
  result = await  FilePicker.platform.pickFiles();
  setState(() {
    
  });
  }

  void playAudio() {
    if(result != null){
      audioPlayer.play(DeviceFileSource(result!.files.single.path!));
    }
  }

  void togglePlaybackRate() {
   playbackRate = playbackRate == 1 ? 2 : 1;
   audioPlayer.setPlaybackRate(playbackRate);
   setState(() {   });
  }
}

