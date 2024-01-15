part of 'ml_bloc.dart';

@freezed
class MlState with _$MlState {
  const factory MlState.initial() = _Initial;
  const factory MlState.loading() = _Loading;
  const factory MlState.success({
    required PredictionResult data,
  }) = _Success;
  const factory MlState.error({
    required String message,
  }) = _Error;
}
