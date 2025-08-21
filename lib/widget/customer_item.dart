import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_contact.dart';

class CustomerItem extends StatelessWidget {
  final CustomerContact customerContact;
  final VoidCallback onTap;

  const CustomerItem({
    super.key,
    required this.customerContact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(customerContact.customerImage),
              radius: 24,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundImage: AssetImage(customerContact.channelImage),
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerContact.customerName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    customerContact.customerNote,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: customerContact.statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    customerContact.status,
                    style: TextStyle(
                      color: customerContact.statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (customerContact.tag != null) ...[
                  const SizedBox(height: 5),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: customerContact.tagColor?.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      customerContact.tag!,
                      style: TextStyle(
                        color: customerContact.tagColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
