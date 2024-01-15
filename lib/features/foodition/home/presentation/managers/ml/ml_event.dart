part of 'ml_bloc.dart';

@freezed
class MlEvent with _$MlEvent {
  const factory MlEvent.predict({required File file}) = _Predict;
  const factory MlEvent.clear() = _Clear;
}
