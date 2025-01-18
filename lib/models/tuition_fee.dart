import 'dart:convert';

class TuitionFee {
  final String degree;
  final String duration;
  final String admissionFee;
  final TotalFee totalFee;
  final SemesterFee semesterFee;
  final List<String> additionalNotes;

  TuitionFee({
    required this.degree,
    required this.duration,
    required this.admissionFee,
    required this.totalFee,
    required this.semesterFee,
    required this.additionalNotes,
  });

  factory TuitionFee.fromJson(Map<String, dynamic> json) {
    return TuitionFee(
      degree: json['degree'] as String,
      duration: json['duration'] as String,
      admissionFee: json['admission_fee'] as String,
      totalFee: TotalFee.fromJson(json['total_fee'] as Map<String, dynamic>),
      semesterFee:
          SemesterFee.fromJson(json['semester_fee'] as Map<String, dynamic>),
      additionalNotes: List<String>.from(json['additional_notes'] as List),
    );
  }

  Map<String, dynamic> toJson() => {
        'degree': degree,
        'duration': duration,
        'admission_fee': admissionFee,
        'total_fee': totalFee.toJson(),
        'semester_fee': semesterFee.toJson(),
        'additional_notes': additionalNotes,
      };
}

class TotalFee {
  final String courseFee;
  final String totalFeeWithAdmission;

  TotalFee({
    required this.courseFee,
    required this.totalFeeWithAdmission,
  });

  factory TotalFee.fromJson(Map<String, dynamic> json) {
    return TotalFee(
      courseFee: json['course_fee'] as String,
      totalFeeWithAdmission: json['total_fee_with_admission'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'course_fee': courseFee,
        'total_fee_with_admission': totalFeeWithAdmission,
      };
}

class SemesterFee {
  final String admissionPlusFirstInstallment;
  final String installments;

  SemesterFee({
    required this.admissionPlusFirstInstallment,
    required this.installments,
  });

  factory SemesterFee.fromJson(Map<String, dynamic> json) {
    return SemesterFee(
      admissionPlusFirstInstallment:
          json['admission_plus_first_installment'] as String,
      installments: json['installments'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'admission_plus_first_installment': admissionPlusFirstInstallment,
        'installments': installments,
      };
}
