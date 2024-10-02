import 'package:flutter/material.dart';
import 'notes.dart';
import 'board_game_card.dart';
import 'board_game_detail_page.dart';

class LikedPage extends StatelessWidget {
  final Set<Note> likedGames;
  final Function(Note) onLikedToggle;

  const LikedPage({
    Key? key,
    required this.likedGames,
    required this.onLikedToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedGamesList = likedGames.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75, // Adjust as needed
        ),
        itemCount: likedGamesList.length,
        itemBuilder: (BuildContext context, int index) {
          final note = likedGamesList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardGameDetailPage(
                    name: note.name,
                    imageUrl: note.imageUrl,
                    fullDescription: note.fullinfo,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                BoardGameCard(
                  name: note.name,
                  imageUrl: note.imageUrl,
                  shortDescription: note.text,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      onLikedToggle(note);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}