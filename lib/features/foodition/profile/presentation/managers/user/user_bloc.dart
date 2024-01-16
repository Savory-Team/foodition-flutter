import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/request/requests.dart';
import '../../../domain/models/user_model.dart';
import '../../../domain/repositories/user_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;
  UserBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_GetData>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.show();
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(_Success(data: data)),
      );
    });

    on<_EditAddress>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editAddress(event.request);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditPhotoProfile>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editPhotoProfile(event.image);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditPassword>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editPassword(event.request);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditUsername>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editUsername(event.username);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditName>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editName(event.name);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditBio>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editBio(event.bio);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditPhoneNumber>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editPhoneNumber(event.phoneNumber);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditGender>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editGender(event.gender);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditBirthdate>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editBirthdate(event.birthdate);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });
  }
}
