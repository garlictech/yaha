// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'important_pois_along_hike_with_yaha_pois.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$importantPoisAlongHikeWithYahaPoisHash() =>
    r'8f8b05fd77887904212370cc5c28e7980165abec';

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

abstract class _$ImportantPoisAlongHikeWithYahaPois
    extends BuildlessAutoDisposeNotifier<LoadableState<List<PoiOfHike>>> {
  late final String hikeId;

  LoadableState<List<PoiOfHike>> build(
    String hikeId,
  );
}

/// See also [ImportantPoisAlongHikeWithYahaPois].
@ProviderFor(ImportantPoisAlongHikeWithYahaPois)
const importantPoisAlongHikeWithYahaPoisProvider =
    ImportantPoisAlongHikeWithYahaPoisFamily();

/// See also [ImportantPoisAlongHikeWithYahaPois].
class ImportantPoisAlongHikeWithYahaPoisFamily
    extends Family<LoadableState<List<PoiOfHike>>> {
  /// See also [ImportantPoisAlongHikeWithYahaPois].
  const ImportantPoisAlongHikeWithYahaPoisFamily();

  /// See also [ImportantPoisAlongHikeWithYahaPois].
  ImportantPoisAlongHikeWithYahaPoisProvider call(
    String hikeId,
  ) {
    return ImportantPoisAlongHikeWithYahaPoisProvider(
      hikeId,
    );
  }

  @override
  ImportantPoisAlongHikeWithYahaPoisProvider getProviderOverride(
    covariant ImportantPoisAlongHikeWithYahaPoisProvider provider,
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
  String? get name => r'importantPoisAlongHikeWithYahaPoisProvider';
}

/// See also [ImportantPoisAlongHikeWithYahaPois].
class ImportantPoisAlongHikeWithYahaPoisProvider
    extends AutoDisposeNotifierProviderImpl<ImportantPoisAlongHikeWithYahaPois,
        LoadableState<List<PoiOfHike>>> {
  /// See also [ImportantPoisAlongHikeWithYahaPois].
  ImportantPoisAlongHikeWithYahaPoisProvider(
    this.hikeId,
  ) : super.internal(
          () => ImportantPoisAlongHikeWithYahaPois()..hikeId = hikeId,
          from: importantPoisAlongHikeWithYahaPoisProvider,
          name: r'importantPoisAlongHikeWithYahaPoisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$importantPoisAlongHikeWithYahaPoisHash,
          dependencies: ImportantPoisAlongHikeWithYahaPoisFamily._dependencies,
          allTransitiveDependencies: ImportantPoisAlongHikeWithYahaPoisFamily
              ._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is ImportantPoisAlongHikeWithYahaPoisProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  LoadableState<List<PoiOfHike>> runNotifierBuild(
    covariant ImportantPoisAlongHikeWithYahaPois notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
