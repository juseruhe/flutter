import 'package:flutter/material.dart';

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
      home: SecretListenerHomepage(),
    );
  }
}

class SecretListenerHomepage extends StatefulWidget {
  const SecretListenerHomepage({super.key});

  @override
  State<SecretListenerHomepage> createState() => _SecretListenerHomepageState();
}

class _SecretListenerHomepageState extends State<SecretListenerHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secret Listener'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Center(
          child: Column(
            children: [
              Image.network('https://thumbs.dreamstime.com/b/logotipo-de-whatsapp-verde-para-web-y-app-ui-aislado-en-fondo-blanco-png-transparente-265016403.jpg', 
              height: 300
                    ),
               const Text('Scegli un vocale')
            ],
          ),
        ),
       floatingActionButton: FloatingActionButton(
        onPressed: pickFile(),
        child: const Icon(Icons.audio_file)
        ),
    );
  }
  
  pickFile() {}
}

