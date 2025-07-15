import 'package:hive_flutter/hive_flutter.dart';

class HiveController {
  static final HiveController instance = HiveController._internal();
  factory HiveController() => instance;

  static const String _boxName = 'appBox';
  late Box _box;

  HiveController._internal();

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  //  Ma'lumot yozish
  Future<void> write<T>(String key, T value) async {
    await _box.put(key, value);
  }

  //  Ma'lumot o'qish
  T? read<T>(String key) {
    return _box.get(key) as T?;
  }

  //  Ma'lumot o'chirish
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  //  Barcha ma'lumotlarni o'chirish
  Future<void> clear() async {
    await _box.clear();
  }

  //  Kalit borligini tekshirish
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  //  Faqat boxni olish kerak bo'lsa (rare case)
  Box get box => _box;
}

//! Saqlash
// await HiveController.instance.write<String>('token', '123abc');

//! O'qish
// String? token = HiveController.instance.read<String>('token');

//! O'chirish
// await HiveController.instance.delete('token');

//! Tozalash
// await HiveController.instance.clear();
