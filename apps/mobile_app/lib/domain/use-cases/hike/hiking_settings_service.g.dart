// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking_settings_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hikingSettingsServiceHash() =>
    r'5c5237f8c8175387310f7fb26897f55adcdbcf04';

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

abstract class _$HikingSettingsService
    extends BuildlessAutoDisposeNotifier<HikingSettings> {
  late final String hikeId;

  HikingSettings build(
    String hikeId,
  );
}

/// See also [HikingSettingsService].
@ProviderFor(HikingSettingsService)
const hikingSettingsServiceProvider = HikingSettingsServiceFamily();

/// See also [HikingSettingsService].
class HikingSettingsServiceFamily extends Family<HikingSettings> {
  /// See also [HikingSettingsService].
  const HikingSettingsServiceFamily();

  /// See also [HikingSettingsService].
  HikingSettingsServiceProvider call(
    String hikeId,
  ) {
    return HikingSettingsServiceProvider(
      hikeId,
    );
  }

  @override
  HikingSettingsServiceProvider getProviderOverride(
    covariant HikingSettingsServiceProvider provider,
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
  String? get name => r'hikingSettingsServiceProvider';
}

/// See also [HikingSettingsService].
class HikingSettingsServiceProvider extends AutoDisposeNotifierProviderImpl<
    HikingSettingsService, HikingSettings> {
  /// See also [HikingSettingsService].
  HikingSettingsServiceProvider(
    this.hikeId,
  ) : super.internal(
          () => HikingSettingsService()..hikeId = hikeId,
          from: hikingSettingsServiceProvider,
          name: r'hikingSettingsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hikingSettingsServiceHash,
          dependencies: HikingSettingsServiceFamily._dependencies,
          allTransitiveDependencies:
              HikingSettingsServiceFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is HikingSettingsServiceProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  HikingSettings runNotifierBuild(
    covariant HikingSettingsService notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
