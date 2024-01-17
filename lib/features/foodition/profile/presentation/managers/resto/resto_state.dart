part of 'resto_bloc.dart';

@freezed
class RestoState with _$RestoState {
  const factory RestoState.initial() = _Initial;
  const factory RestoState.loading() = _Loading;
  const factory RestoState.success({
    required RestoModel data,
  }) = _Success;
  const factory RestoState.error({
    required String message,
  }) = _Error;
}
