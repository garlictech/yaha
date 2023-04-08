// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_pois_of_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherPoisOfHikeHash() => r'd28579c0ff792c4a025b4df2c8c2ca61cdbd843e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WeatherPoisOfHike
    extends BuildlessAutoDisposeNotifier<List<PoiOfHike>> {
  late final String hikeId;

  List<PoiOfHike> build(
    String hikeId,
  );
}

/// See also [WeatherPoisOfHike].
@ProviderFor(WeatherPoisOfHike)
const weatherPoisOfHikeProvider = WeatherPoisOfHikeFamily();

/// See also [WeatherPoisOfHike].
class WeatherPoisOfHikeFamily extends Family<List<PoiOfHike>> {
  /// See also [WeatherPoisOfHike].
  const WeatherPoisOfHikeFamily();

  /// See also [WeatherPoisOfHike].
  WeatherPoisOfHikeProvider call(
    String hikeId,
  ) {
    return WeatherPoisOfHikeProvider(
      hikeId,
    );
  }

  @override
  WeatherPoisOfHikeProvider getProviderOverride(
    covariant WeatherPoisOfHikeProvider provider,
  ) {
    return call(
      provider.hikeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherPoisOfHikeProvider';
}

/// See also [WeatherPoisOfHike].
class WeatherPoisOfHikeProvider extends AutoDisposeNotifierProviderImpl<
    WeatherPoisOfHike, List<PoiOfHike>> {
  /// See also [WeatherPoisOfHike].
  WeatherPoisOfHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => WeatherPoisOfHike()..hikeId = hikeId,
          from: weatherPoisOfHikeProvider,
          name: r'weatherPoisOfHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherPoisOfHikeHash,
          dependencies: WeatherPoisOfHikeFamily._dependencies,
          allTransitiveDependencies:
              WeatherPoisOfHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is WeatherPoisOfHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<PoiOfHike> runNotifierBuild(
    covariant WeatherPoisOfHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
