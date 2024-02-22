package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.revenuecat.purchases_flutter.PurchasesFlutterPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    PurchasesFlutterPlugin.registerWith(registry.registrarFor("com.revenuecat.purchases_flutter.PurchasesFlutterPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
