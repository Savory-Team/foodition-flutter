import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/request/transaction_request.dart';
import '../../../domain/models/models.dart';
import '../../../domain/repositories/repositories.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;
  TransactionBloc(
    this._repository,
  ) : super(const _Initial()) {
    on<_GetData>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.getTransactions();
      result.match(
        (error) => emit(_Error(message: error)),
        (data) {
          if (data.isEmpty) {
            emit(const _Empty());
          } else {
            emit(_Success(histories: data));
          }
        },
      );
    });

    on<_Order>((event, emit) async {
      emit(const _Loading());
      final result = await _repository.createTransaction(event.request);
      result.match(
        (error) => emit(_Error(message: error)),
        (data) => add(const _GetData()),
      );
    });
  }
}
