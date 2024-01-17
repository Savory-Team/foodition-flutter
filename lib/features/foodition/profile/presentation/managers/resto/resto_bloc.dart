import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/request/requests.dart';
import '../../../domain/models/models.dart';
import '../../../domain/repositories/resto_repository.dart';

part 'resto_bloc.freezed.dart';
part 'resto_event.dart';
part 'resto_state.dart';

class RestoBloc extends Bloc<RestoEvent, RestoState> {
  final RestoRepository _repository;
  RestoBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_GetData>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.getMyResto();
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

    on<_EditPhotoResto>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editPhotoResto(event.image);
      result.match(
        (error) {
          emit(_Error(message: error));
          add(const _GetData());
        },
        (data) => add(const _GetData()),
      );
    });

    on<_EditResto>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.editResto(event.request);
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
