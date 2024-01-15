enum PredictionStatus {
  edible,
  inedible;

  bool get isEdible => this == PredictionStatus.edible;
  bool get isInedible => this == PredictionStatus.inedible;
}
