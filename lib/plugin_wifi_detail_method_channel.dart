import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_wifi_detail_platform_interface.dart';

/// An implementation of [PluginWifiDetailPlatform] that uses method channels.
class MethodChannelPluginWifiDetail extends PluginWifiDetailPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_wifi_detail');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> getSSID() async{
    // TODO: implement getSSID
    final ssid = await methodChannel.invokeMethod<String>('getSSID');
    return ssid;
  }
  @override
  Future<int?> getRxLinkSpeedMbps() async{
    // TODO: implement getRxLinkSpeedMbps
    final rxLinkSpeedMbps = await methodChannel.invokeMethod<int>('getRxLinkSpeedMbps');
    return rxLinkSpeedMbps;
  }
  @override
  Future<int?> getLinkSpeed() async{
    // TODO: implement getLinkSpeed
    final linkSpeed = await methodChannel.invokeMethod<int>('getLinkSpeed');
    return linkSpeed;
  }
  @override
  Future<int?> getSignal() async{
    // TODO: implement getSignal
    final signal = await methodChannel.invokeMethod<int>('getSignal');
    return signal;
  }
  @override
  Future<String?> getIP() async{
    // TODO: implement getIP
    final ip = await methodChannel.invokeMethod<String>('getIP');
    return ip;
  }
  @override
  Future<String?> getHostAddress() async{
    // TODO: implement getHostAddress
    final hostAddress = await methodChannel.invokeMethod<String>('getHostAddress');
    return hostAddress;
  }
  @override
  Future<String?> getDnsServers() async{
    // TODO: implement getDnsServers
    final dnsServers = await methodChannel.invokeMethod<String>('getDnsServers');
    return dnsServers;
  }
}
