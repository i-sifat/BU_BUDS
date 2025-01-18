import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tuition_fee.dart';
import 'pdf_service.dart';

class TuitionFeeService {
  static const String _cacheKey = 'tuition_fees_cache';
  static const Duration _cacheExpiration = Duration(days: 7);

  final PDFService _pdfService;

  TuitionFeeService() : _pdfService = PDFService();

  Future<List<TuitionFee>> getTuitionFees({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _getCachedData();
      if (cached != null) return cached;
    }

    try {
      final pdfPath = await _pdfService.downloadPDF();
      final fees = await _pdfService.extractPDFContent(pdfPath);
      await _cacheData(fees);
      return fees;
    } catch (e) {
      throw Exception('Failed to fetch tuition fees: $e');
    }
  }

  Future<String> getPDFPath() async {
    return await _pdfService.downloadPDF();
  }

  Future<List<TuitionFee>?> _getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getString(_cacheKey);
    if (cached == null) return null;

    final data = jsonDecode(cached) as Map<String, dynamic>;
    final timestamp = DateTime.parse(data['timestamp'] as String);

    if (DateTime.now().difference(timestamp) > _cacheExpiration) {
      return null;
    }

    return (data['fees'] as List)
        .map((fee) => TuitionFee.fromJson(fee as Map<String, dynamic>))
        .toList();
  }

  Future<void> _cacheData(List<TuitionFee> fees) async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'timestamp': DateTime.now().toIso8601String(),
      'fees': fees.map((fee) => fee.toJson()).toList(),
    };
    await prefs.setString(_cacheKey, jsonEncode(data));
  }
}
