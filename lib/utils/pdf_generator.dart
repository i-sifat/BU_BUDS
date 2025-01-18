import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../models/routine.dart';

class PdfGenerator {
  static Future<void> generateRoutinePdf(List<ScheduleItem> schedules) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Header(
                level: 0,
                child: pw.Text(
                  'Class Routine',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      _buildHeaderCell('Day'),
                      _buildHeaderCell('Time'),
                      _buildHeaderCell('Course'),
                      _buildHeaderCell('Room'),
                      _buildHeaderCell('Teacher'),
                    ],
                  ),
                  ...schedules.map((schedule) {
                    return pw.TableRow(
                      children: [
                        _buildCell(schedule.dayOfWeek),
                        _buildCell(
                            '${schedule.startTime} - ${schedule.endTime}'),
                        _buildCell(schedule.courseCode),
                        _buildCell(schedule.room),
                        _buildCell(schedule.teacherName),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/routine.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  static pw.Widget _buildHeaderCell(String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      ),
    );
  }

  static pw.Widget _buildCell(String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(text),
    );
  }
}
