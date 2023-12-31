#ifndef FLUTTER_PLUGIN_PLUGIN_WIFI_DETAIL_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_WIFI_DETAIL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_wifi_detail {

class PluginWifiDetailPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginWifiDetailPlugin();

  virtual ~PluginWifiDetailPlugin();

  // Disallow copy and assign.
  PluginWifiDetailPlugin(const PluginWifiDetailPlugin&) = delete;
  PluginWifiDetailPlugin& operator=(const PluginWifiDetailPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_wifi_detail

#endif  // FLUTTER_PLUGIN_PLUGIN_WIFI_DETAIL_PLUGIN_H_
