enum PredictionStatus {
  proper,
  inappropriate;

  bool get isProper => this == PredictionStatus.proper;
  bool get isInappropriate => this == PredictionStatus.inappropriate;
}
