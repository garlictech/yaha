// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-by-content-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchByContentInput {
  const $SearchByContentInput();

  String get content;
  String get objectType;
  int? get limit;
  String? get nextToken;

  SearchByContentInput copyWith({
    String? content,
    String? objectType,
    int? limit,
    String? nextToken,
  }) =>
      SearchByContentInput(
        content: content ?? this.content,
        objectType: objectType ?? this.objectType,
        limit: limit ?? this.limit,
        nextToken: nextToken ?? this.nextToken,
      );

  SearchByContentInput copyUsing(
      void Function(SearchByContentInput$Change change) mutator) {
    final change = SearchByContentInput$Change._(
      this.content,
      this.objectType,
      this.limit,
      this.nextToken,
    );
    mutator(change);
    return SearchByContentInput(
      content: change.content,
      objectType: change.objectType,
      limit: change.limit,
      nextToken: change.nextToken,
    );
  }

  @override
  String toString() =>
      "SearchByContentInput(content: $content, objectType: $objectType, limit: $limit, nextToken: $nextToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchByContentInput &&
      other.runtimeType == runtimeType &&
      content == other.content &&
      objectType == other.objectType &&
      limit == other.limit &&
      nextToken == other.nextToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + content.hashCode;
    result = 37 * result + objectType.hashCode;
    result = 37 * result + limit.hashCode;
    result = 37 * result + nextToken.hashCode;
    return result;
  }
}

class SearchByContentInput$Change {
  SearchByContentInput$Change._(
    this.content,
    this.objectType,
    this.limit,
    this.nextToken,
  );

  String content;
  String objectType;
  int? limit;
  String? nextToken;
}

// ignore: avoid_classes_with_only_static_members
class SearchByContentInput$ {
  static final content = Lens<SearchByContentInput, String>(
    (contentContainer) => contentContainer.content,
    (contentContainer, content) => contentContainer.copyWith(content: content),
  );

  static final objectType = Lens<SearchByContentInput, String>(
    (objectTypeContainer) => objectTypeContainer.objectType,
    (objectTypeContainer, objectType) =>
        objectTypeContainer.copyWith(objectType: objectType),
  );

  static final limit = Lens<SearchByContentInput, int?>(
    (limitContainer) => limitContainer.limit,
    (limitContainer, limit) => limitContainer.copyWith(limit: limit),
  );

  static final nextToken = Lens<SearchByContentInput, String?>(
    (nextTokenContainer) => nextTokenContainer.nextToken,
    (nextTokenContainer, nextToken) =>
        nextTokenContainer.copyWith(nextToken: nextToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchByContentInput _$SearchByContentInputFromJson(
        Map<String, dynamic> json) =>
    SearchByContentInput(
      content: json['content'] as String,
      objectType: json['objectType'] as String,
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchByContentInputToJson(
        SearchByContentInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'objectType': instance.objectType,
      'limit': instance.limit,
      'nextToken': instance.nextToken,
    };
