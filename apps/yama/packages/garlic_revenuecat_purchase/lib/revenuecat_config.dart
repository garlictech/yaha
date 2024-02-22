class RevenuecatConfig {
  final String appleApiKey;
  final String amazonApiKey;
  final String googleApiKey;
  final String entitlementId;

  const RevenuecatConfig(
      {required this.appleApiKey,
      required this.entitlementId,
      this.amazonApiKey = "NO_AMAZON_API_KEY",
      this.googleApiKey = "NO_GOOGLE_API_KEY"});
}
