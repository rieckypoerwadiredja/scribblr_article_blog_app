import 'dart:math';

import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  final String image;
  final double? size;
  final double? rounded;

  const LoadingImage({
    super.key,
    required this.image,
    this.size,
    this.rounded = 0,
  });

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
          fit: BoxFit.cover,
          alignment: Alignment.center,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          errorBuilder: (context, error, stackTrace) {
            // Placeholder ketika gambar gagal dimuat
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                    size: max((size! * 2 / 3) / 20, 12),
                  ),
                  Text(
                    'Error loading image', // Teks placeholder
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: max((size! * 2 / 3) / 20, 12),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
