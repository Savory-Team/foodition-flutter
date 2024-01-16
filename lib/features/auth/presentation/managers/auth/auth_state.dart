part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.successListen() = _SuccessListen;
  const factory AuthState.error({
    required String message,
  }) = _Error;
}
