import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  String image;
  double? size;
  double? rounded;
  LoadingImage({super.key, required this.image, this.size, this.rounded = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(rounded!),
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
