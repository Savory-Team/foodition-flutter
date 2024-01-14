part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(LoginRequest request) = _Login;
  const factory AuthEvent.register(RegisterRequest request) = _Register;
  const factory AuthEvent.verify(VerifyRequest request) = _Verify;
  const factory AuthEvent.getData() = _GetData;
  const factory AuthEvent.logout() = _Logout;
}
