import 'package:flutter/material.dart';

class BoardGameCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String shortDescription;
  //final VoidCallback onTap;
  //final VoidCallback onLike; // Новый параметр для удаления

  BoardGameCard({
    required this.name,
    required this.imageUrl,
    required this.shortDescription,
    //required this.onTap,
    //required this.onLike, // Инициализация нового параметра
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Обёртка для изображения с кнопкой удаления
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print(imageUrl);
                    print(error);
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 100,
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                name,
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                shortDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}