enum DistanceType {
  kilometros,
  metros,
  centimetros,
  milimetros,
  pulgadas,
  pies,
}

class Distance {
  final double value;
  final DistanceType from;
  final DistanceType to;

  Distance({required this.value, required this.from, required this.to});
}
