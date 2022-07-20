// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $UserState {
  const $UserState();

  String get avatarImage;
  String get nick;

  UserState copyWith({
    String? avatarImage,
    String? nick,
  }) =>
      UserState(
        avatarImage: avatarImage ?? this.avatarImage,
        nick: nick ?? this.nick,
      );

  UserState copyUsing(void Function(UserState$Change change) mutator) {
    final change = UserState$Change._(
      this.avatarImage,
      this.nick,
    );
    mutator(change);
    return UserState(
      avatarImage: change.avatarImage,
      nick: change.nick,
    );
  }

  @override
  String toString() => "UserState(avatarImage: $avatarImage, nick: $nick)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is UserState &&
      other.runtimeType == runtimeType &&
      avatarImage == other.avatarImage &&
      nick == other.nick;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + avatarImage.hashCode;
    result = 37 * result + nick.hashCode;
    return result;
  }
}

class UserState$Change {
  UserState$Change._(
    this.avatarImage,
    this.nick,
  );

  String avatarImage;
  String nick;
}

// ignore: avoid_classes_with_only_static_members
class UserState$ {
  static final avatarImage = Lens<UserState, String>(
    (avatarImageContainer) => avatarImageContainer.avatarImage,
    (avatarImageContainer, avatarImage) =>
        avatarImageContainer.copyWith(avatarImage: avatarImage),
  );

  static final nick = Lens<UserState, String>(
    (nickContainer) => nickContainer.nick,
    (nickContainer, nick) => nickContainer.copyWith(nick: nick),
  );
}
