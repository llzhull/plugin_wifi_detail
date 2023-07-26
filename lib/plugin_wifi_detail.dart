
import 'plugin_wifi_detail_platform_interface.dart';

class PluginWifiDetail {
  Future<String?> getPlatformVersion() {
    return PluginWifiDetailPlatform.instance.getPlatformVersion();
  }
  Future<String?> getSSID() {
    return PluginWifiDetailPlatform.instance.getSSID();
  }

  Future<int?> getRxLinkSpeedMbps() {
    return PluginWifiDetailPlatform.instance.getRxLinkSpeedMbps();
  }

  Future<int?> getLinkSpeed() {
    return PluginWifiDetailPlatform.instance.getLinkSpeed();
  }

  Future<int?> getSignal() {
    return PluginWifiDetailPlatform.instance.getSignal();
  }
  Future<String?> getIP() {
    return PluginWifiDetailPlatform.instance.getIP();
  }
  Future<String?> getHostAddress() {
    return PluginWifiDetailPlatform.instance.getHostAddress();
  }
  Future<String?> getDnsServers() {
    return PluginWifiDetailPlatform.instance.getDnsServers();
  }
}
