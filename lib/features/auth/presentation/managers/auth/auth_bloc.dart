import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/models.dart';
import '../../../domain/repositories/repositories.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.login(event.request);
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(const _SuccessListen()),
      );
    });

    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.register(event.request);
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(const _SuccessListen()),
      );
    });

    on<_Verify>((event, emit) async {
      final result = await _repository.verify(event.request);
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(const _SuccessListen()),
      );
    });

    on<_ReSendOtp>((event, emit) async {
      await _repository.reSendOtp(event.email);
    });

    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.logout();
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(const _Initial()),
      );
    });
  }
}
