package com.example.plugin_wifi_detail;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.Network;
import android.net.RouteInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** PluginWifiDetailPlugin */
public class PluginWifiDetailPlugin implements FlutterPlugin, MethodCallHandler {
  private static final String TAG = "PluginWifiDetailPlugin";
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private WifiManager wifiManager;
  private ConnectivityManager mConnectivityManager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugin_wifi_detail");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
    wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
    mConnectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getPlatformVersion": {
        result.success("An " + android.os.Build.VERSION.RELEASE);
      }
      break;
      case "getSSID": {
        WifiInfo info = wifiManager.getConnectionInfo();

        // This value should be wrapped in double quotes, so we need to unwrap it.
        String ssid = info.getSSID();
        if (ssid.startsWith("\"") && ssid.endsWith("\"")) {
          ssid = ssid.substring(1, ssid.length() - 1);
        }
        result.success(ssid);
      }
      break;
      case "getRxLinkSpeedMbps": {
        WifiInfo info = wifiManager.getConnectionInfo();
        int rxLinkSpeedMbps = 0;
        if (android.os.Build.VERSION.SDK_INT > android.os.Build.VERSION_CODES.Q) {
          rxLinkSpeedMbps = info.getRxLinkSpeedMbps();
          result.success(rxLinkSpeedMbps);
        }
      }
      break;

      case "getSignal": {
        WifiInfo info = wifiManager.getConnectionInfo();
        int rssi = info.getRssi();
        result.success(rssi);

      }
      break;
      case "getLinkSpeed": {
        WifiInfo info = wifiManager.getConnectionInfo();
        int linkSpeed = info.getLinkSpeed();
        result.success(linkSpeed);

      }
      break;
      case "getIP": {
        WifiInfo info = wifiManager.getConnectionInfo();
        String formatIP = formatIP(info.getIpAddress());
        result.success(formatIP);
      }
      break;

      case "getHostAddress": {
        Network activeNetwork = mConnectivityManager.getActiveNetwork();
        String mHostAddress = null;
        if (activeNetwork != null) {
          LinkProperties linkProperties = mConnectivityManager.getLinkProperties(activeNetwork);
          List<LinkAddress> linkAddresses = linkProperties.getLinkAddresses();
          List<RouteInfo> routes = linkProperties.getRoutes();
          if (routes != null && !routes.isEmpty()) {
            for (int i = 0; i < routes.size(); i++) {//和ip地址一样，需要判断获取的网址符不符合正则表达式
              RouteInfo routeInfo = routes.get(i);
              if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                if (routeInfo.hasGateway()) {
                  mHostAddress = routeInfo.getGateway().getHostAddress();
                  break;
                }
              } else {
                String hostAddress = routeInfo.getGateway().getHostAddress();
                if (!"0.0.0.0".equals(hostAddress)) {
                  mHostAddress = hostAddress;
                  break;
                }
              }


            }
            Log.e(TAG, "onCreate: mHostAddress = " + mHostAddress);
          }

        }
        result.success(mHostAddress);
      }
      break;
      case "getDnsServers": {
        Network activeNetwork = mConnectivityManager.getActiveNetwork();
        String dnsServers = null;
        if (activeNetwork != null) {
          LinkProperties linkProperties = mConnectivityManager.getLinkProperties(activeNetwork);
          dnsServers = linkProperties.getDnsServers().stream()
                  .map(InetAddress::getHostAddress)
                  .collect(Collectors.joining("\n"));
          Log.e(TAG, "onCreate: dnsServers = " + dnsServers);
        }

        result.success(dnsServers);
      }
      break;
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
  private String formatIP(int ip) {
    return String.format(
            "%d.%d.%d.%d",
            (ip & 0xff),
            (ip >> 8 & 0xff),
            (ip >> 16 & 0xff),
            (ip >> 24 & 0xff)
    );
  }
}
