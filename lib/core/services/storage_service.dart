import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/models/position_model.dart';


class StorageService {
  final Box _box = Hive.box(AppLocaleKeys.user);

  Future<void> putUserId(String? userId) async {
    await _box.put(_StorageKeys.userId, userId);
  }

  Future<void> putAccessToken(String? accessToken) async {
    await _box.put(_StorageKeys.accessToken, accessToken);
  }

  Future<void> putRefreshToken(String? refreshToken) async {
    await _box.put(_StorageKeys.refreshToken, refreshToken);
  }

  Future<void> putCurrentLocation(String location) async {
    await _box.put(_StorageKeys.currentLocation, location);
  }

  Future<void> putCurrentPosition(Position position) async {
    await _box.put(
        _StorageKeys.currentPosition, PositionModel.fromPosition(position));
  }

  Future<void> putLogInTime(String time) async {
    await _box.put(_StorageKeys.registerTime, time);
  }

  Future<void> putSavedHouse(List<dynamic> houses) async {
    await _box.put(_StorageKeys.savedHouse, houses);
  }

  Future<void> putNotificationsIndex(List indexs) async {
    await _box.put(_StorageKeys.notifications, indexs);
  }

  Future<void> putFirstTime(bool isFirstTime) async {
    await _box.put(_StorageKeys.isFirstTime, isFirstTime);
  }

  Future<bool> getFirstTime() async {
    return await _box.get(_StorageKeys.isFirstTime, defaultValue: false);
  }

  Future<List> getNotificationsIndex() async {
    return await _box.get(_StorageKeys.notifications, defaultValue: []);
  }

  Future<List<dynamic>> getSavedHouses() async {
    return await _box.get(_StorageKeys.savedHouse, defaultValue: []);
  }

  Future<String> getLogInTime() async {
    return await _box.get(_StorageKeys.registerTime, defaultValue: null);
  }

  Future<String?> getUserId() async {
    return await _box.get(_StorageKeys.userId, defaultValue: null);
  }

  Future<String?> getAccessToken() async {
    return await _box.get(_StorageKeys.accessToken, defaultValue: null);
  }

  Future<String?> getRefreshToken() async {
    return await _box.get(_StorageKeys.refreshToken, defaultValue: null);
  }

  Future<String?> getCurrentLocation() async {
    return await _box.get(_StorageKeys.currentLocation, defaultValue: null);
  }

  Future<PositionModel?> getCurrentPosition() async {
    return await _box.get(_StorageKeys.currentPosition, defaultValue: null);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}

class _StorageKeys {
  static const userId = 'UserId';
  static const accessToken = 'AccessToken';
  static const refreshToken = 'RefreshToken';
  static const currentLocation = "CurrentLocation";
  static const currentPosition = "CurrentPosition";
  static const savedHouse = "Savedhouse";
  static const registerTime = "RegisteredTime";
  static const notifications = "NotifcationsIndex";
  static const isFirstTime = "IsFirstTime";
}
