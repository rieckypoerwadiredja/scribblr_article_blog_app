import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final double? size;
  const ProfileImage({super.key, required this.image, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
            color: Colors.grey[300],
            child: Image.network(
              image, // URL gambar
              width: size, // Ukuran gambar
              height: size,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              fit: BoxFit.cover,
            )));
  }
}
