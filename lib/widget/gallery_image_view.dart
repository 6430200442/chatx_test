import 'package:flutter/material.dart';
// import 'package:image_downloader/image_downloader.dart'; // สำหรับดาวน์โหลดภาพ (ต้องเพิ่ม dependency ด้วย)

class GalleryImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryImageView({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<GalleryImageView> createState() => _GalleryImageViewState();
}

class _GalleryImageViewState extends State<GalleryImageView> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  Future<void> _downloadImage(String imagePath) async {
    try {
      // await ImageDownloader.downloadImage(imagePath); // ใช้ path แบบเน็ตจะง่ายกว่า asset
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image downloaded')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Image ${_currentIndex + 1} / ${widget.images.length}'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(
                  widget.images[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.download),
              onPressed: () => _downloadImage(widget.images[_currentIndex]),
            ),
          ),
        ],
      ),
    );
  }
}
