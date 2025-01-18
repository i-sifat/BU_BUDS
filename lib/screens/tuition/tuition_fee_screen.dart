import 'package:flutter/material.dart';
import '../../models/tuition_fee.dart';
import '../../services/tuition_fee_service.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class TuitionFeeScreen extends StatefulWidget {
  const TuitionFeeScreen({super.key});

  @override
  State<TuitionFeeScreen> createState() => _TuitionFeeScreenState();
}

class _TuitionFeeScreenState extends State<TuitionFeeScreen> {
  final _tuitionService = TuitionFeeService();
  bool _isLoading = true;
  String? _error;
  List<TuitionFee>? _fees;
  String _selectedCategory = 'MBA';

  final List<String> _categories = ['MBA', 'Graduate', 'Undergraduate'];

  @override
  void initState() {
    super.initState();
    _loadFees();
  }

  Future<void> _loadFees({bool forceRefresh = false}) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final fees =
          await _tuitionService.getTuitionFees(forceRefresh: forceRefresh);
      if (!mounted) return;

      setState(() {
        _fees = fees;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Fees'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, style: AppTypography.bodyMedium),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loadFees(forceRefresh: true),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildFeeCard(
                title: 'MBA (Reg 60 Cr.)',
                totalFee: '150000',
                breakdown: {
                  'Total Fee': '120000',
                  'Admission fee': '30000',
                  'Semester Fee': '',
                  'Waiver Fee': '',
                },
              ),
              const SizedBox(height: 16),
              _buildFeeCard(
                title: 'MBA (Reg 60 Cr.)',
                totalFee: '150000',
                breakdown: {},
              ),
              const SizedBox(height: 16),
              _buildFeeCard(
                title: 'MBA (Reg 60 Cr.)',
                totalFee: '150000',
                breakdown: {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeeCard({
    required String title,
    required String totalFee,
    required Map<String, String> breakdown,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'T ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                totalFee,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (breakdown.isNotEmpty) ...[
            const SizedBox(height: 16),
            ...breakdown.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    if (entry.value.isNotEmpty)
                      Text(
                        entry.value,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}
