import 'package:flutter_example/utils/converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  const MatchModel._();
  factory MatchModel({
    required int id,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @DateTimeConverter() DateTime? matchDate,
    required String player1,
    required String score1,
    required String player2,
    required String score2,
    required String winner,
    required String tv,
    required String radio,
    required String stadium,
    required String remarks,
    required String reviewUrl,
    required String highlightUrl,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
