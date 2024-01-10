import '../enums/prediction_status.dart';

class PredictionResult {
  final PredictionStatus status;
  final String result;
  final String explanation;

  PredictionResult({
    required this.status,
    required this.result,
    required this.explanation,
  });
}
