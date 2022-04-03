import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';

class GuestHomeScreenViewModel {
  final FutureProvider<Either<Failure, List<Hike>>> bestHikesNearbyProvider;
  final FutureProvider<Either<Failure, List<Hike>>> bestHikesOfTheWorldProvider;

  GuestHomeScreenViewModel(
      {required this.bestHikesNearbyProvider,
      required this.bestHikesOfTheWorldProvider});
}
