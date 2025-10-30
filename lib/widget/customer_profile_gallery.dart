import 'package:flutter/material.dart';
import 'package:chatx_test/pages/gallery_view_all.dart';
import 'package:chatx_test/model/customer_profile.dart';

class CustomerProfileGallery extends StatefulWidget {
  final CustomerProfile profile;

  const CustomerProfileGallery({super.key, required this.profile});

  @override
  State<CustomerProfileGallery> createState() => _CustomerProfileGalleryState();
}

class _CustomerProfileGalleryState extends State<CustomerProfileGallery> {
  @override
  Widget build(BuildContext context) {

    final List<String> images =
      widget.profile.sentImages.map((img) => img.imageUrl).toList();

    int crossAxisCount = 3; 
    int maxRows = 2;
    int maxItems = crossAxisCount * maxRows;

    List<String> limitImages =
      images.length > maxItems ? images.sublist(0, maxItems) : images;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Gallery',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (_) => GalleryViewAllPage(images: widget.profile.sentImages)),
                  );
              },
              child: const Text(
              'View all',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
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
              return Image.network(limitImages[index], fit: BoxFit.cover);
            }),
        const Divider(
          height: 24,
        ),
      ],
    );
  }
}
