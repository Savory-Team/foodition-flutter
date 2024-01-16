part of 'transaction_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.empty() = _Empty;
  const factory TransactionState.success({
    required List<HistoryModel> histories,
  }) = _Success;
  const factory TransactionState.error({
    required String message,
  }) = _Error;
}
