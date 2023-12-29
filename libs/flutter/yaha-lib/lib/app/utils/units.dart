String getDistanceString(double distanceInMeters) {
  return distanceInMeters < 2000
      ? '${distanceInMeters.round()}m'
      : '${(distanceInMeters / 100).round() / 10}km';
}
