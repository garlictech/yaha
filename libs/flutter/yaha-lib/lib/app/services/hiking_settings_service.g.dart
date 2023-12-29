// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking_settings_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hikingSettingsServiceHash() =>
    r'96e740c6c75f91d0ddd41a806cc192f5ca277e5d';

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
    extends BuildlessAutoDisposeNotifier<HikingSettingsEntity> {
  late final String hikeId;

  HikingSettingsEntity build(
    String hikeId,
  );
}

/// See also [HikingSettingsService].
@ProviderFor(HikingSettingsService)
const hikingSettingsServiceProvider = HikingSettingsServiceFamily();

/// See also [HikingSettingsService].
class HikingSettingsServiceFamily extends Family<HikingSettingsEntity> {
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
    HikingSettingsService, HikingSettingsEntity> {
  /// See also [HikingSettingsService].
  HikingSettingsServiceProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  HikingSettingsServiceProvider._internal(
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
  HikingSettingsEntity runNotifierBuild(
    covariant HikingSettingsService notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(HikingSettingsService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HikingSettingsServiceProvider._internal(
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
  AutoDisposeNotifierProviderElement<HikingSettingsService,
      HikingSettingsEntity> createElement() {
    return _HikingSettingsServiceProviderElement(this);
  }

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
}

mixin HikingSettingsServiceRef
    on AutoDisposeNotifierProviderRef<HikingSettingsEntity> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _HikingSettingsServiceProviderElement
    extends AutoDisposeNotifierProviderElement<HikingSettingsService,
        HikingSettingsEntity> with HikingSettingsServiceRef {
  _HikingSettingsServiceProviderElement(super.provider);

  @override
  String get hikeId => (origin as HikingSettingsServiceProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
