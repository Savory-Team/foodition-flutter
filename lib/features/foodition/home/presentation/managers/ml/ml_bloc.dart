import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/models.dart';
import '../../../domain/repositories/repositories.dart';

part 'ml_event.dart';
part 'ml_state.dart';
part 'ml_bloc.freezed.dart';

class MlBloc extends Bloc<MlEvent, MlState> {
  final MlRepository _repository;
  MlBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_Predict>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.predict(event.file);
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => emit(_Success(data: data)),
      );
    });

    on<_Clear>((event, emit) => emit(const _Initial()));
  }
}
