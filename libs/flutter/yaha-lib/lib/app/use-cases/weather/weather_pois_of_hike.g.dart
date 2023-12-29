// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_pois_of_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherPoisOfHikeHash() => r'd7fb15badce2a94e4c110231fbfb8b3813bcfc5a';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [WeatherPoisOfHike].
@ProviderFor(WeatherPoisOfHike)
const weatherPoisOfHikeProvider = WeatherPoisOfHikeFamily();

/// See also [WeatherPoisOfHike].
class WeatherPoisOfHikeFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
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
class WeatherPoisOfHikeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WeatherPoisOfHike, List<PoiOfHikeEntity>> {
  /// See also [WeatherPoisOfHike].
  WeatherPoisOfHikeProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  WeatherPoisOfHikeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hikeId,
  }) : super.internal();

  final String hikeId;

  @override
  FutureOr<List<PoiOfHikeEntity>> runNotifierBuild(
    covariant WeatherPoisOfHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(WeatherPoisOfHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeatherPoisOfHikeProvider._internal(
        () => create()..hikeId = hikeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hikeId: hikeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WeatherPoisOfHike,
      List<PoiOfHikeEntity>> createElement() {
    return _WeatherPoisOfHikeProviderElement(this);
  }

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
}

mixin WeatherPoisOfHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _WeatherPoisOfHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WeatherPoisOfHike,
        List<PoiOfHikeEntity>> with WeatherPoisOfHikeRef {
  _WeatherPoisOfHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as WeatherPoisOfHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
