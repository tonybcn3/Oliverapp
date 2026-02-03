import 'package:flutter/material.dart';
import 'youtube_video_screen.dart'; // la pantalla que ya tienes

class ListaVideosScreen extends StatelessWidget {
  const ListaVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de vídeos (ahora solo uno, más adelante puedes añadir más)
    final videos = [
      {
        'titulo': 'Informativos UTE Diciembre 25',
        'url': 'QMmVGhHrhsU',
        'thumbnail': 'https://img.youtube.com/vi/QMmVGhHrhsU/0.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vídeos'),
        backgroundColor: const Color.fromARGB(255, 233, 120, 28),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YoutubeVideoScreen(videoId: video['url']!),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.network(
                    video['thumbnail']!,
                    width: 120,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      video['titulo']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
