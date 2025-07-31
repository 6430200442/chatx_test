import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/widget/gallery_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GalleryViewAllPage extends StatelessWidget {
  final List<CustomerSentImage> images;

  const GalleryViewAllPage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    // กลุ่มรูปตามวันที่
    Map<String, List<CustomerSentImage>> groupedImages = {};
    for (var img in images) {
      String dateStr = DateFormat('yyyy-MM-dd').format(img.sentAt);
      if (!groupedImages.containsKey(dateStr)) {
        groupedImages[dateStr] = [];
      }
      groupedImages[dateStr]!.add(img);
    }

    // 🔽 เรียงวันที่ล่าสุดไว้บน
    final sortedDates = groupedImages.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Images'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: sortedDates.length,
        itemBuilder: (context, dateIndex) {
          String dateStr = sortedDates[dateIndex];
          List<CustomerSentImage> dayImages = groupedImages[dateStr]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd MMMM yyyy').format(DateTime.parse(dateStr)),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dayImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // รวมรูปทั้งหมดเพื่อส่งไปดูแบบเต็ม
                      final allImages = images.map((e) => e.imageUrl).toList();
                      final tappedIndex =
                          allImages.indexOf(dayImages[index].imageUrl);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GalleryImageView(
                            images: allImages,
                            initialIndex: tappedIndex,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      dayImages[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}

