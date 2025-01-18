// import 'package:flutter/material.dart';
// import '../../models/tuition_fee.dart';
// import '../../services/tuition_fee_service.dart';
// import '../../utils/colors.dart';
// import '../../utils/typography.dart';

// class TuitionFeeScreen extends StatefulWidget {
//   const TuitionFeeScreen({super.key});

//   @override
//   State<TuitionFeeScreen> createState() => _TuitionFeeScreenState();
// }

// class _TuitionFeeScreenState extends State<TuitionFeeScreen> {
//   final _tuitionService = TuitionFeeService();
//   bool _isLoading = true;
//   String? _error;
//   List<TuitionFee>? _fees;

//   @override
//   void initState() {
//     super.initState();
//     _loadFees();
//   }

//   Future<void> _loadFees({bool forceRefresh = false}) async {
//     if (!mounted) return;

//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       final fees =
//           await _tuitionService.getTuitionFees(forceRefresh: forceRefresh);
//       if (!mounted) return;

//       setState(() {
//         _fees = fees;
//         _isLoading = false;
//       });
//     } catch (e) {
//       if (!mounted) return;

//       setState(() {
//         _error = e.toString();
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tuition Fees', style: AppTypography.h3),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () => _loadFees(forceRefresh: true),
//           ),
//         ],
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (_error != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_error!, style: AppTypography.bodyMedium),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _loadFees(forceRefresh: true),
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     if (_fees == null || _fees!.isEmpty) {
//       return const Center(
//         child: Text('No tuition fee information available'),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () => _loadFees(forceRefresh: true),
//       child: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: _fees!.length,
//         itemBuilder: (context, index) => _buildFeeCard(_fees![index]),
//       ),
//     );
//   }

//   Widget _buildFeeCard(TuitionFee fee) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               fee.degree,
//               style: AppTypography.h3.copyWith(color: AppColors.primary),
//             ),
//             const SizedBox(height: 8),
//             Text('Duration: ${fee.duration}'),
//             const Divider(),
//             _buildFeeSection('Admission Fee', fee.admissionFee),
//             _buildFeeSection('Course Fee', fee.totalFee.courseFee),
//             _buildFeeSection(
//               'Total Fee (with admission)',
//               fee.totalFee.totalFeeWithAdmission,
//             ),
//             const Divider(),
//             Text(
//               'Semester Fee Breakdown',
//               style:
//                   AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             _buildFeeSection(
//               'First Installment',
//               fee.semesterFee.admissionPlusFirstInstallment,
//             ),
//             _buildFeeSection(
//                 'Other Installments', fee.semesterFee.installments),
//             if (fee.additionalNotes.isNotEmpty) ...[
//               const Divider(),
//               Text(
//                 'Additional Notes',
//                 style: AppTypography.bodyLarge
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               ...fee.additionalNotes.map((note) => Padding(
//                     padding: const EdgeInsets.only(bottom: 4),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('• '),
//                         Expanded(child: Text(note)),
//                       ],
//                     ),
//                   )),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeeSection(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: AppTypography.bodyMedium),
//           Text(
//             value,
//             style:
//                 AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
