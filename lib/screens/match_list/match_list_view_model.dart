import 'package:flutter_example/models/match_model.dart';
import 'package:flutter_example/widgets/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'match_list_view_model.g.dart';

@riverpod
class MatchListViewModel extends _$MatchListViewModel {
  @override
  Future<List<MatchModel>?> build() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      //TODO matchDate으로 필터링
      var result = await dio.get('/match');
      List<MatchModel> matchList =
          result.data.map<MatchModel>((e) => MatchModel.fromJson(e)).toList();

      return matchList;
    });
    return state.value;
  }
}
