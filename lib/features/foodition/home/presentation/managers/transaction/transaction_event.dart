part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.getData() = _GetData;
  const factory TransactionEvent.order(TransactionRequest request) = _Order;
}
