import 'package:chatx_test/widget/gallery_image_view.dart';
import 'package:flutter/material.dart';

class GalleryViewAllPage extends StatefulWidget {
  final List<String> images;

  const GalleryViewAllPage({super.key, required this.images});

  @override
  State<GalleryViewAllPage> createState() => _GalleryViewAllPageState();
}

class _GalleryViewAllPageState extends State<GalleryViewAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Images'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          shrinkWrap: true, // ใ
          physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อน
          itemCount: widget.images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1),
          // itemBuilder: (context, index) {
          //   return Image.asset(widget.images[index], fit: BoxFit.cover);
          // }
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GalleryImageView(
                      images: widget.images,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
