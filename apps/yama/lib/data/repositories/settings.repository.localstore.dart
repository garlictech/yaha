import 'dart:convert';
import 'package:yama_motivate/data/infrastructure/localstore_handler.dart';
import 'package:yama_motivate/domain/entities/daily_reminder_setting.dart';
import 'package:yama_motivate/domain/entities/settings.dart';
import 'package:yama_motivate/domain/repositories/settings.repository.dart';

class SettingsRepositoryLocalStore extends SettingsRepository {
  static const key = "SETTINGS";
  final _localStoreHandler = LocalStoreHandler();

  @override
  fetch() async {
    final dataStr = await _localStoreHandler.getItem(key);

    if (dataStr == null) {
      return null;
    }

    final data = _addDefaultsIfMissing(jsonDecode(dataStr));

    return Settings.fromJson(data);
  }

  @override
  store(Settings settings) async {
    await _localStoreHandler.setItem(key, settings.toJson());
  }

  Map<String, dynamic> _addDefaultsIfMissing(Map<String, dynamic> data) {
    final newData = {...data};

    if (newData['dailyReminder'] == null) {
      newData['dailyReminder'] = const DailyReminderSetting().toJson();
    }

    return newData;
  }
}
