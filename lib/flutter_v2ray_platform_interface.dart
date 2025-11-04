import 'package:flutter_v2ray_client/model/v2ray_status.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_v2ray_method_channel.dart';

/// The interface that implementations of flutter_v2ray_client must implement.
///
/// Platform implementations should extend this class rather than implement it as flutter_v2ray_client
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added methods.
abstract class FlutterV2rayPlatform extends PlatformInterface {
  /// Constructs a FlutterV2rayPlatform.
  FlutterV2rayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterV2rayPlatform _instance = MethodChannelFlutterV2ray();

  /// The default instance of [FlutterV2rayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterV2ray].
  static FlutterV2rayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterV2rayPlatform] when
  /// they register themselves.
  static set instance(FlutterV2rayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Requests permission to use V2Ray features, such as VPN access.
  /// Returns a [Future] that completes with a [bool] indicating whether permission was granted.
  Future<bool> requestPermission() {
    throw UnimplementedError('requestPermission() has not been implemented.');
  }

  /// Initializes the V2Ray client with a status change callback and notification settings.
  /// [onStatusChanged] is a callback that will be invoked when the V2Ray status changes.
  /// [notificationIconResourceType] specifies the type of the notification icon resource (e.g., 'mipmap').
  /// [notificationIconResourceName] specifies the name of the notification icon resource (e.g., 'ic_launcher').
  /// Returns a [Future] that completes when initialization is done.
  Future<void> initializeV2Ray({
    required void Function(V2RayStatus status) onStatusChanged,
    required String notificationIconResourceType,
    required String notificationIconResourceName,
  }) {
    throw UnimplementedError('initializeV2Ray() has not been implemented.');
  }

  /// Starts the V2Ray connection with the given configuration and settings.
  /// [remark] is a string identifier for the connection.
  /// [config] is the V2Ray configuration in JSON format.
  /// [notificationDisconnectButtonName] is the text for the disconnect button in notifications.
  /// [blockedApps] is an optional list of apps to block.
  /// [bypassSubnets] is an optional list of subnets to bypass.
  /// [proxyOnly] is a boolean indicating whether to use proxy-only mode (default is false).
  /// Returns a [Future] that completes when the connection starts.
  Future<void> startV2Ray({
    required String remark,
    required String config,
    required String notificationDisconnectButtonName,
    List<String>? blockedApps,
    List<String>? bypassSubnets,
    bool proxyOnly = false,
  }) {
    throw UnimplementedError('startV2Ray() has not been implemented.');
  }

  /// Stops the V2Ray connection.
  /// Returns a [Future] that completes when the connection is stopped.
  Future<void> stopV2Ray() {
    throw UnimplementedError('stopV2Ray() has not been implemented.');
  }

  /// Measures the delay to a V2Ray server using the provided configuration and URL.
  /// [config] is the V2Ray configuration in JSON format.
  /// [url] is the server URL to test.
  /// Returns a [Future] that completes with the delay in milliseconds.
  Future<int> getServerDelay({required String config, required String url}) {
    throw UnimplementedError('getServerDelay() has not been implemented.');
  }

  /// Measures delays to multiple V2Ray servers concurrently using the provided configurations and URL.
  /// [configs] is a list of V2Ray configurations in JSON format.
  /// [url] is the server URL to test.
  /// [maxConcurrency] limits the number of simultaneous measurements.
  /// [timeoutMs] specifies the timeout in milliseconds for each measurement.
  /// Returns a [Future] that completes with the delays in milliseconds, aligned with [configs].
  Future<List<int>> getServersDelayConcurrently({
    required List<String> configs,
    required String url,
    required int maxConcurrency,
    required int timeoutMs,
  }) {
    throw UnimplementedError(
      'getServersDelayConcurrently() has not been implemented.',
    );
  }

  /// Measures the delay to the currently connected V2Ray server.
  /// [url] is the server URL to test.
  /// Returns a [Future] that completes with the delay in milliseconds.
  Future<int> getConnectedServerDelay(String url) async {
    throw UnimplementedError(
      'getConnectedServerDelay() has not been implemented.',
    );
  }

  /// Retrieves the version of the V2Ray core.
  /// Returns a [Future] that completes with a [String] representing the core version.
  Future<String> getCoreVersion() async {
    throw UnimplementedError(
      'getCoreVersion() has not been implemented.',
    );
  }

  /// Retrieves V2Ray logs from the system logcat.
  /// Returns a [Future] that completes with a [List] of log lines.
  /// On non-Android platforms, returns an empty list.
  Future<List<String>> getLogs() async {
    throw UnimplementedError(
      'getLogs() has not been implemented.',
    );
  }

  /// Clears the V2Ray logs from the system logcat.
  /// Returns a [Future] that completes with a [bool] indicating success.
  /// On non-Android platforms, returns true.
  Future<bool> clearLogs() async {
    throw UnimplementedError(
      'clearLogs() has not been implemented.',
    );
  }
}
