// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configured_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configuredHikeHash() => r'8dc6ae480d4d02542807eb79c9779bd72cd37d6e';

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

abstract class _$ConfiguredHike
    extends BuildlessAutoDisposeNotifier<LoadableState<Hike>> {
  late final String hikeId;

  LoadableState<Hike> build(
    String hikeId,
  );
}

/// See also [ConfiguredHike].
@ProviderFor(ConfiguredHike)
const configuredHikeProvider = ConfiguredHikeFamily();

/// See also [ConfiguredHike].
class ConfiguredHikeFamily extends Family<LoadableState<Hike>> {
  /// See also [ConfiguredHike].
  const ConfiguredHikeFamily();

  /// See also [ConfiguredHike].
  ConfiguredHikeProvider call(
    String hikeId,
  ) {
    return ConfiguredHikeProvider(
      hikeId,
    );
  }

  @override
  ConfiguredHikeProvider getProviderOverride(
    covariant ConfiguredHikeProvider provider,
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
  String? get name => r'configuredHikeProvider';
}

/// See also [ConfiguredHike].
class ConfiguredHikeProvider extends AutoDisposeNotifierProviderImpl<
    ConfiguredHike, LoadableState<Hike>> {
  /// See also [ConfiguredHike].
  ConfiguredHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => ConfiguredHike()..hikeId = hikeId,
          from: configuredHikeProvider,
          name: r'configuredHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$configuredHikeHash,
          dependencies: ConfiguredHikeFamily._dependencies,
          allTransitiveDependencies:
              ConfiguredHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is ConfiguredHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  LoadableState<Hike> runNotifierBuild(
    covariant ConfiguredHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
