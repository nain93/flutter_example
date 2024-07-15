import 'package:flutter_example/repositories/token_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  Future<void> build() async {
    // return await init();
  }

  // Future<UserModel?> init() async {
  //   UserModel? user = await ref.watch(sessionUseCaseProvider).loggedinUser();
  //   state = AsyncValue.data(user);
  //   return user;
  // }

  Future<String> signIn(String token) async {
    await TokenRepository.instance.setToken(token: token);
    return '';
    // return state.value;
  }

  Future<String> signOut() async {
    await TokenRepository.instance.removeToken();
    return '';
    // return state.value?.nickname ?? '';
  }

  void clearData() {
    state = const AsyncValue.data(null);
  }
}
