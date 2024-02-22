import '../entities/settings.dart';

abstract class SettingsRepository {
  Future<Settings?> fetch();
  Future<void> store(Settings settings);
}
