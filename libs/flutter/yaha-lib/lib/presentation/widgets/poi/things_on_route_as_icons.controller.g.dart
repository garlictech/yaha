// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'things_on_route_as_icons.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$thingsOnRouteAsIconsControllerHash() =>
    r'8dbc9589b8dfcb644c30b6c6235ca754a3352ebf';

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

abstract class _$ThingsOnRouteAsIconsController
    extends BuildlessAutoDisposeAsyncNotifier<ThingsOnRouteAsIconsState> {
  late final String hikeId;

  FutureOr<ThingsOnRouteAsIconsState> build(
    String hikeId,
  );
}

/// See also [ThingsOnRouteAsIconsController].
@ProviderFor(ThingsOnRouteAsIconsController)
const thingsOnRouteAsIconsControllerProvider =
    ThingsOnRouteAsIconsControllerFamily();

/// See also [ThingsOnRouteAsIconsController].
class ThingsOnRouteAsIconsControllerFamily
    extends Family<AsyncValue<ThingsOnRouteAsIconsState>> {
  /// See also [ThingsOnRouteAsIconsController].
  const ThingsOnRouteAsIconsControllerFamily();

  /// See also [ThingsOnRouteAsIconsController].
  ThingsOnRouteAsIconsControllerProvider call(
    String hikeId,
  ) {
    return ThingsOnRouteAsIconsControllerProvider(
      hikeId,
    );
  }

  @override
  ThingsOnRouteAsIconsControllerProvider getProviderOverride(
    covariant ThingsOnRouteAsIconsControllerProvider provider,
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
  String? get name => r'thingsOnRouteAsIconsControllerProvider';
}

/// See also [ThingsOnRouteAsIconsController].
class ThingsOnRouteAsIconsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ThingsOnRouteAsIconsController,
        ThingsOnRouteAsIconsState> {
  /// See also [ThingsOnRouteAsIconsController].
  ThingsOnRouteAsIconsControllerProvider(
    String hikeId,
  ) : this._internal(
          () => ThingsOnRouteAsIconsController()..hikeId = hikeId,
          from: thingsOnRouteAsIconsControllerProvider,
          name: r'thingsOnRouteAsIconsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$thingsOnRouteAsIconsControllerHash,
          dependencies: ThingsOnRouteAsIconsControllerFamily._dependencies,
          allTransitiveDependencies:
              ThingsOnRouteAsIconsControllerFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  ThingsOnRouteAsIconsControllerProvider._internal(
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
  FutureOr<ThingsOnRouteAsIconsState> runNotifierBuild(
    covariant ThingsOnRouteAsIconsController notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(ThingsOnRouteAsIconsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThingsOnRouteAsIconsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ThingsOnRouteAsIconsController,
      ThingsOnRouteAsIconsState> createElement() {
    return _ThingsOnRouteAsIconsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ThingsOnRouteAsIconsControllerProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ThingsOnRouteAsIconsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ThingsOnRouteAsIconsState> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _ThingsOnRouteAsIconsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ThingsOnRouteAsIconsController,
        ThingsOnRouteAsIconsState> with ThingsOnRouteAsIconsControllerRef {
  _ThingsOnRouteAsIconsControllerProviderElement(super.provider);

  @override
  String get hikeId =>
      (origin as ThingsOnRouteAsIconsControllerProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
