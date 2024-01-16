part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success({
    required UserModel data,
  }) = _Success;
  const factory UserState.error({
    required String message,
  }) = _Error;
}
