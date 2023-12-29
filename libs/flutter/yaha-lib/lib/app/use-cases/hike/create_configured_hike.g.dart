// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_configured_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createConfiguredHikeHash() =>
    r'70be57d5712efa03691f92a6890781e55d01a787';

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

abstract class _$CreateConfiguredHike
    extends BuildlessAutoDisposeAsyncNotifier<HikeEntity> {
  late final String hikeId;

  FutureOr<HikeEntity> build(
    String hikeId,
  );
}

/// See also [CreateConfiguredHike].
@ProviderFor(CreateConfiguredHike)
const createConfiguredHikeProvider = CreateConfiguredHikeFamily();

/// See also [CreateConfiguredHike].
class CreateConfiguredHikeFamily extends Family<AsyncValue<HikeEntity>> {
  /// See also [CreateConfiguredHike].
  const CreateConfiguredHikeFamily();

  /// See also [CreateConfiguredHike].
  CreateConfiguredHikeProvider call(
    String hikeId,
  ) {
    return CreateConfiguredHikeProvider(
      hikeId,
    );
  }

  @override
  CreateConfiguredHikeProvider getProviderOverride(
    covariant CreateConfiguredHikeProvider provider,
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
  String? get name => r'createConfiguredHikeProvider';
}

/// See also [CreateConfiguredHike].
class CreateConfiguredHikeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CreateConfiguredHike, HikeEntity> {
  /// See also [CreateConfiguredHike].
  CreateConfiguredHikeProvider(
    String hikeId,
  ) : this._internal(
          () => CreateConfiguredHike()..hikeId = hikeId,
          from: createConfiguredHikeProvider,
          name: r'createConfiguredHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createConfiguredHikeHash,
          dependencies: CreateConfiguredHikeFamily._dependencies,
          allTransitiveDependencies:
              CreateConfiguredHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  CreateConfiguredHikeProvider._internal(
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
  FutureOr<HikeEntity> runNotifierBuild(
    covariant CreateConfiguredHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(CreateConfiguredHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateConfiguredHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CreateConfiguredHike, HikeEntity>
      createElement() {
    return _CreateConfiguredHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateConfiguredHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateConfiguredHikeRef
    on AutoDisposeAsyncNotifierProviderRef<HikeEntity> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _CreateConfiguredHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CreateConfiguredHike,
        HikeEntity> with CreateConfiguredHikeRef {
  _CreateConfiguredHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as CreateConfiguredHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
