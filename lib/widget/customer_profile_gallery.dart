import 'package:flutter/material.dart';
import 'package:chatx_test/pages/gallery_view_all.dart';

class CustomerProfileGallery extends StatefulWidget {
  const CustomerProfileGallery({super.key});

  @override
  State<CustomerProfileGallery> createState() => _CustomerProfileGalleryState();
}

class _CustomerProfileGalleryState extends State<CustomerProfileGallery> {
  @override
  Widget build(BuildContext context) {

    final List<String> imageTest =
        List.generate(12, (index) => 'assets/imgs/agent1.jpg');

    int crossAxisCount = 3; 
    int maxRows = 2;
    int maxItems = crossAxisCount * maxRows;

    List<String> limitImages = imageTest.length > maxItems ? imageTest.sublist(0, maxItems) : imageTest;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Gallery',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (_) => GalleryViewAllPage(images: imageTest)),
                  );
              },
              child: const Text(
              'View all',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
              ),
            ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            shrinkWrap: true, //
            physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อน
            itemCount: limitImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8, 
                mainAxisSpacing: 8, 
                childAspectRatio: 1 
                ), 
            itemBuilder: (context, index) {
              return Image.asset(limitImages[index], fit: BoxFit.cover);
            }),
        const Divider(
          height: 24,
        ),
      ],
    );
  }
}
