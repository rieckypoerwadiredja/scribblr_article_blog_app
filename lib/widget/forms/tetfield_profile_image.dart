import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/utils/custom_colors.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';

class TetfieldProfileImage extends StatelessWidget {
  const TetfieldProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const ProfileImage(
              image:
                  'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
                maxLines: 1,
                // Menentukan tinggi area teks (jumlah baris)
                decoration: InputDecoration(
                  hintText: "Add a comment",
                  filled: true, // Aktifkan background warna
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0), // Border rounded
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: CustomColors.primaryColor, // Primary color
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Padding teks
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send,
                        color: CustomColors.primaryColor),
                    onPressed: () {},
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
