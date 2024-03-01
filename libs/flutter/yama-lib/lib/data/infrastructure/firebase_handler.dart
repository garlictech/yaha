import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseHandler {
  final String userId;

  FirebaseDatabaseHandler({required this.userId});

  void write({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _dbRef(key).set(data);
    } catch (e) {
      rethrow;
    }
  }

  void append({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    try {
      final newData = _dbRef(key).push();
      newData.set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> readList(String key) async {
    try {
      final snapshot = await _dbRef(key).get();

      if (snapshot.exists) {
        final values = (snapshot.value.keys)
            .map((key) =>
                Map<String, dynamic>.from({'id': key, ...snapshot.value[key]}))
            .toList();
        return List<Map<String, dynamic>>.from(values);
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> readValue<T>(String key) async {
    try {
      final snapshot = await _dbRef(key).get();

      if (snapshot.exists) {
        return snapshot.value as T;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _dbRef(key).set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateValue<T>({
    required String key,
    required T data,
  }) async {
    try {
      await _dbRef(key).set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete({
    required String key,
  }) async {
    try {
      await _dbRef(key).remove();
    } catch (e) {
      rethrow;
    }
  }

  _dbRef(String key) {
    return FirebaseDatabase.instance.ref("users/$userId/$key");
  }
}
