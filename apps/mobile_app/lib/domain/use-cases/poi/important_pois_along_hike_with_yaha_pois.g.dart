// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'important_pois_along_hike_with_yaha_pois.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$importantPoisAlongHikeWithYahaPoisProviderHash() =>
    r'd82c73f8275f3ddecd7cf4ce2a6bf4d185523265';

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

abstract class _$ImportantPoisAlongHikeWithYahaPoisProvider
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHike>> {
  late final String hikeId;

  Future<List<PoiOfHike>> build(
    String hikeId,
  );
}

/// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
@ProviderFor(ImportantPoisAlongHikeWithYahaPoisProvider)
const importantPoisAlongHikeWithYahaPoisProviderProvider =
    ImportantPoisAlongHikeWithYahaPoisProviderFamily();

/// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
class ImportantPoisAlongHikeWithYahaPoisProviderFamily
    extends Family<AsyncValue<List<PoiOfHike>>> {
  /// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
  const ImportantPoisAlongHikeWithYahaPoisProviderFamily();

  /// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
  ImportantPoisAlongHikeWithYahaPoisProviderProvider call(
    String hikeId,
  ) {
    return ImportantPoisAlongHikeWithYahaPoisProviderProvider(
      hikeId,
    );
  }

  @override
  ImportantPoisAlongHikeWithYahaPoisProviderProvider getProviderOverride(
    covariant ImportantPoisAlongHikeWithYahaPoisProviderProvider provider,
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
  String? get name => r'importantPoisAlongHikeWithYahaPoisProviderProvider';
}

/// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
class ImportantPoisAlongHikeWithYahaPoisProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        ImportantPoisAlongHikeWithYahaPoisProvider, List<PoiOfHike>> {
  /// See also [ImportantPoisAlongHikeWithYahaPoisProvider].
  ImportantPoisAlongHikeWithYahaPoisProviderProvider(
    this.hikeId,
  ) : super.internal(
          () => ImportantPoisAlongHikeWithYahaPoisProvider()..hikeId = hikeId,
          from: importantPoisAlongHikeWithYahaPoisProviderProvider,
          name: r'importantPoisAlongHikeWithYahaPoisProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$importantPoisAlongHikeWithYahaPoisProviderHash,
          dependencies:
              ImportantPoisAlongHikeWithYahaPoisProviderFamily._dependencies,
          allTransitiveDependencies:
              ImportantPoisAlongHikeWithYahaPoisProviderFamily
                  ._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is ImportantPoisAlongHikeWithYahaPoisProviderProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<PoiOfHike>> runNotifierBuild(
    covariant ImportantPoisAlongHikeWithYahaPoisProvider notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
