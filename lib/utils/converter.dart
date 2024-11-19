import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? timestamp) {
    if (timestamp == null) {
      return DateTime.now();
    }

    return DateTime.parse(timestamp.toString());
  }

  @override
  String? toJson(DateTime? _) =>
      _?.toUtc().add(const Duration(hours: 9)).toIso8601String();
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();
  static const Color defaultColor = Color.fromRGBO(0, 0, 0, 0);

  @override
  Color fromJson(int? json) => json == null ? defaultColor : Color(json);

  @override
  int toJson(Color? object) =>
      object == null ? defaultColor.value : object.value;
}

class MatrixConverter implements JsonConverter<Matrix4, List<double>?> {
  const MatrixConverter();

  @override
  Matrix4 fromJson(List<double>? json) {
    if (json == null) {
      return Matrix4.identity();
    }
    return Matrix4.fromList(json);
  }

  @override
  List<double> toJson(Matrix4 matrix) {
    return matrix.storage.toList();
  }
}

class OuulStoreMatrixConverter
    implements JsonConverter<Matrix4, List<dynamic>?> {
  const OuulStoreMatrixConverter();

  @override
  Matrix4 fromJson(List<dynamic>? json) {
    if (json == null) {
      return Matrix4.identity();
    }
    List<double> matrixValues = List<double>.from(json);
    return Matrix4.fromList(matrixValues);
  }

  @override
  List<double> toJson(Matrix4 matrix) {
    return matrix.storage.toList();
  }
}
