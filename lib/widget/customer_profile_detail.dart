// import 'package:chatx_test/widget/profile_detail_edit.dart';
// import 'package:flutter/material.dart';
// import 'package:chatx_test/model/customer_profile.dart';

// class CustomerProfileDetail extends StatefulWidget {
//   final CustomerProfile profile;
//   const CustomerProfileDetail({super.key, required this.profile});

//   @override
//   State<CustomerProfileDetail> createState() => _CustomerProfileDetailState();
// }

// class _CustomerProfileDetailState extends State<CustomerProfileDetail> {
//   bool isEditing = false;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.profile.customerDetail.firstName;
//     lastNameController.text = widget.profile.customerDetail.lastName;
//     phoneController.text = widget.profile.customerDetail.phoneNumber;
//     emailController.text = widget.profile.customerDetail.email;
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     lastNameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     super.dispose();
//   }

//   void toggleEditing() {
//     setState(() {
//       isEditing = !isEditing;

//       if (!isEditing) {
//         //print('Saved: ${nameController.text},${lastNameController.text}');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         ProfileDetailEdit(
//             label: 'Name',
//             controller: nameController,
//             isEditing: isEditing),
//         ProfileDetailEdit(
//             label: 'Last Name',
//             controller: lastNameController,
//             isEditing: isEditing),
//         ProfileDetailEdit(
//             label: 'Phone', controller: phoneController, isEditing: isEditing),
//         ProfileDetailEdit(
//             label: 'Email', controller: emailController, isEditing: isEditing),
//         Align(
//           alignment: Alignment.topRight,
//           child: GestureDetector(
//             onTap: toggleEditing,
//             child: Text(
//               isEditing ? 'Save' : 'Edit',
//               style: const TextStyle(
//                 decoration: TextDecoration.underline,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ),
//         const Divider(
//           height: 24,
//         ),
//       ],
//     );
//   }
// }


import 'package:chatx_test/widget/profile_detail_edit.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_profile.dart';

class CustomerProfileDetail extends StatefulWidget {
  final CustomerProfile profile;
  const CustomerProfileDetail({super.key, required this.profile});

  @override
  State<CustomerProfileDetail> createState() => _CustomerProfileDetailState();
}

class _CustomerProfileDetailState extends State<CustomerProfileDetail> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.profile.customerDetail.firstName;
    lastNameController.text = widget.profile.customerDetail.lastName;
    phoneController.text = widget.profile.customerDetail.phoneNumber;
    emailController.text = widget.profile.customerDetail.email;
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
      if (!isEditing) {
        // ตัวอย่าง: บันทึกข้อมูล
        // print('Saved: ${nameController.text}, ${lastNameController.text}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ProfileDetailEdit(
          label: 'Name',
          controller: nameController,
          isEditing: isEditing,
        ),
        ProfileDetailEdit(
          label: 'Last Name',
          controller: lastNameController,
          isEditing: isEditing,
        ),
        ProfileDetailEdit(
          label: 'Phone',
          controller: phoneController,
          isEditing: isEditing,
        ),
        ProfileDetailEdit(
          label: 'Email',
          controller: emailController,
          isEditing: isEditing,
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: toggleEditing,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isEditing ? Icons.save : Icons.edit,
                  size: 18,
                  color: Colors.grey[700],
                ),
                const SizedBox(width: 4),
                Text(
                  isEditing ? 'Save' : 'Edit',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // const Divider(height: 24),
      ],
    );
  }
}
