import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/data/repositories/settings.repository.localstore.dart';
import 'package:yama_motivate/domain/repositories/settings.repository.dart';

part 'settings.repository.service.g.dart';

@riverpod
class SettingsRepositoryService extends _$SettingsRepositoryService {
  @override
  SettingsRepository? build() {
    return SettingsRepositoryLocalStore();
  }
}
