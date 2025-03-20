class ESPService {
  // Simulate fetching scan results with sample data
  Future<List<Map<String, dynamic>>> fetchScanResults() async {
    // Simulate a delay to mimic network request
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    return [
      {'mac': 'A4:C3:F0:12:34:56', 'rssi': -55},
      {'mac': 'B8:27:EB:89:AB:CD', 'rssi': -70},
      {'mac': 'C4:32:1A:98:76:54', 'rssi': -65},
      {'mac': 'D5:43:2B:87:65:43', 'rssi': -60},
      {'mac': 'E6:54:3C:76:54:32', 'rssi': -75},
    ];
  }
}
