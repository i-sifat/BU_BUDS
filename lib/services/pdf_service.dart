import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../models/tuition_fee.dart';

class PDFService {
  static const String pdfUrl = 'https://bu.edu.bd/course-tuition-fees/';

  Future<String> downloadPDF() async {
    try {
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download PDF');
      }

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/tuition_fees.pdf');
      await file.writeAsBytes(response.bodyBytes);

      return file.path;
    } catch (e) {
      throw Exception('Error downloading PDF: $e');
    }
  }

  // Future<List<TuitionFee>> extractPDFContent(String filePath) async {
  //   try {
  //     final PDFDoc doc = await PDFDoc.fromFile(File(filePath));
  //     final String text = await doc.text;

  //     // Parse the text content into structured data
  //     // This is a simplified example - you'll need to implement proper parsing logic
  //     // based on the actual PDF structure
  //     return _parsePDFContent(text);
  //   } catch (e) {
  //     throw Exception('Error extracting PDF content: $e');
  //   }
  // }

  List<TuitionFee> _parsePDFContent(String content) {
    // Implement parsing logic here based on PDF structure
    // This is a placeholder implementation
    return [
      TuitionFee(
        degree: 'M.Sc.',
        duration: 'Varies by Semester System',
        admissionFee: '14,000 BDT',
        totalFee: TotalFee(
          courseFee: '160,000 BDT',
          totalFeeWithAdmission: '174,000 BDT',
        ),
        semesterFee: SemesterFee(
          admissionPlusFirstInstallment: '32,000 BDT',
          installments: '24,667 BDT x 3 per semester',
        ),
        additionalNotes: [
          'Course fees for each semester are divided into three installments.',
          'One-third must be paid along with admission as the first installment.',
          'Remaining installments are due before midterm and final exams.',
        ],
      ),
    ];
  }
}
