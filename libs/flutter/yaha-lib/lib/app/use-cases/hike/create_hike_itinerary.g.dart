// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_hike_itinerary.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createHikeItineraryHash() =>
    r'755f31c6aba87c4570a53dc0def271b976b4c319';

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

abstract class _$CreateHikeItinerary
    extends BuildlessAutoDisposeAsyncNotifier<HikeItineraryEntity> {
  late final String hikeId;

  FutureOr<HikeItineraryEntity> build(
    String hikeId,
  );
}

/// See also [CreateHikeItinerary].
@ProviderFor(CreateHikeItinerary)
const createHikeItineraryProvider = CreateHikeItineraryFamily();

/// See also [CreateHikeItinerary].
class CreateHikeItineraryFamily
    extends Family<AsyncValue<HikeItineraryEntity>> {
  /// See also [CreateHikeItinerary].
  const CreateHikeItineraryFamily();

  /// See also [CreateHikeItinerary].
  CreateHikeItineraryProvider call(
    String hikeId,
  ) {
    return CreateHikeItineraryProvider(
      hikeId,
    );
  }

  @override
  CreateHikeItineraryProvider getProviderOverride(
    covariant CreateHikeItineraryProvider provider,
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
  String? get name => r'createHikeItineraryProvider';
}

/// See also [CreateHikeItinerary].
class CreateHikeItineraryProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CreateHikeItinerary, HikeItineraryEntity> {
  /// See also [CreateHikeItinerary].
  CreateHikeItineraryProvider(
    String hikeId,
  ) : this._internal(
          () => CreateHikeItinerary()..hikeId = hikeId,
          from: createHikeItineraryProvider,
          name: r'createHikeItineraryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createHikeItineraryHash,
          dependencies: CreateHikeItineraryFamily._dependencies,
          allTransitiveDependencies:
              CreateHikeItineraryFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  CreateHikeItineraryProvider._internal(
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
  FutureOr<HikeItineraryEntity> runNotifierBuild(
    covariant CreateHikeItinerary notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(CreateHikeItinerary Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateHikeItineraryProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CreateHikeItinerary,
      HikeItineraryEntity> createElement() {
    return _CreateHikeItineraryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateHikeItineraryProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateHikeItineraryRef
    on AutoDisposeAsyncNotifierProviderRef<HikeItineraryEntity> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _CreateHikeItineraryProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CreateHikeItinerary,
        HikeItineraryEntity> with CreateHikeItineraryRef {
  _CreateHikeItineraryProviderElement(super.provider);

  @override
  String get hikeId => (origin as CreateHikeItineraryProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
