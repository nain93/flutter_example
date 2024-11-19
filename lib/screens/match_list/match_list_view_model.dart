import 'package:flutter/foundation.dart';
import 'package:flutter_example/models/match_model.dart';
import 'package:flutter_example/utils/converter.dart';
import 'package:flutter_example/utils/utils.dart';
import 'package:flutter_example/widgets/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_list_view_model.freezed.dart';
part 'match_list_view_model.g.dart';

var today = DateTime.now();

@freezed
class MatchListViewState with _$MatchListViewState {
  const MatchListViewState._();
  factory MatchListViewState({
    required DateTime selectedDate,
    required List<MatchModel> matchList,
  }) = _MatchListViewState;
}

@riverpod
class MatchListViewModel extends _$MatchListViewModel {
  @override
  Future<MatchListViewState> build() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      var result = await dio.get(
        '/match',
        queryParameters: {
          'stadium': '잠실',
          'startTime': Utils.formatDate(today),
        },
      );

      if (result.data['items'].isEmpty) {
        return MatchListViewState(
          selectedDate: today,
          matchList: [],
        );
      }

      List<MatchModel> matchList = result.data['items']
          .map<MatchModel>((e) => MatchModel.fromJson(e))
          .toList();

      return MatchListViewState(
        selectedDate: today,
        matchList: matchList,
      );
    });

    return state.value ??
        MatchListViewState(
          selectedDate: today,
          matchList: [],
        );
  }

  Future<void> setSelectedDate(DateTime date) async {
    state = const AsyncValue.loading();
    var result = await dio.get(
      '/match',
      queryParameters: {
        'stadium': '잠실',
        'startTime': Utils.formatDate(date),
      },
    );

    if (result.data['items'].isEmpty) {
      state = AsyncValue.data(
        MatchListViewState(
          selectedDate: date,
          matchList: [],
        ),
      );
      return;
    }

    state = AsyncValue.data(
      MatchListViewState(
        selectedDate: date,
        matchList: result.data['items']
            .map<MatchModel>((e) => MatchModel.fromJson(e))
            .toList(),
      ),
    );
  }
}
