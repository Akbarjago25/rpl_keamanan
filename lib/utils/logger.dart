import 'package:flutter/foundation.dart';

/// Logger terstruktur untuk mencatat pesan aplikasi.
///
/// Log hanya ditampilkan pada mode debug.
/// Jangan gunakan logger untuk mencatat data sensitif.
class Logger {
  /// Log level DEBUG.
  static void debug(String message) {
    if (kDebugMode) {
      debugPrint('[DEBUG] $message');
    }
  }

  /// Log level INFO.
  static void info(String message) {
    if (kDebugMode) {
      debugPrint('[INFO] $message');
    }
  }

  /// Log level WARNING.
  static void warning(String message) {
    if (kDebugMode) {
      debugPrint('[WARNING] $message');
    }
  }

  /// Log level ERROR.
  static void error(String message) {
    if (kDebugMode) {
      debugPrint('[ERROR] $message');
    }
  }
}
