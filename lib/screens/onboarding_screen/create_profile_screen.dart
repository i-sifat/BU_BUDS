// import 'package:flutter/material.dart';
// import '../../utils/colors.dart';
// import '../../utils/typography.dart';
// import 'choosing_subject.dart';

// class CreateProfileScreen extends StatefulWidget {
//   final String userName;

//   const CreateProfileScreen({
//     super.key,
//     required this.userName,
//   });

//   @override
//   State<CreateProfileScreen> createState() => _CreateProfileScreenState();
// }

// class _CreateProfileScreenState extends State<CreateProfileScreen> {
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.userName;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Skip',
//               style: AppTypography.bodyMedium.copyWith(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Create your profile',
//               style: AppTypography.h2,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Provide your profile picture and display your name to make easy delivery',
//               style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
//             ),
//             const SizedBox(height: 48),
//             Center(
//               child: Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundColor: Colors.grey[200],
//                     child: const Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: AppColors.primary,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.add,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 48),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 hintText: 'Your name',
//                 filled: true,
//                 fillColor: Colors.grey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChoosingSubjectView(
//                         userName: _nameController.text,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Continue',
//                   style: AppTypography.buttonLarge,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
