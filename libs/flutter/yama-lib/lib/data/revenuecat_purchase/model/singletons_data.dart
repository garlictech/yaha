class RevenuecatData {
  static final RevenuecatData _appData = RevenuecatData._internal();

  bool entitlementIsActive = false;
  String appUserID = '';

  factory RevenuecatData() {
    return _appData;
  }
  RevenuecatData._internal();
}

final appData = RevenuecatData();
