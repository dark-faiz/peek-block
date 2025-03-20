import 'package:flutter/material.dart';
import '../widgets/device_card.dart';
import '../services/esp_service.dart';

class ScanResultsScreen extends StatefulWidget {
  @override
  _ScanResultsScreenState createState() => _ScanResultsScreenState();
}

class _ScanResultsScreenState extends State<ScanResultsScreen> {
  final ESPService _espService = ESPService();
  List<Map<String, dynamic>> scanResults = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchScanResults();
  }

  Future<void> _fetchScanResults() async {
    try {
      final results = await _espService.fetchScanResults();
      setState(() {
        scanResults = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load scan results: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Results')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: scanResults.length,
                itemBuilder: (context, index) {
                  final device = scanResults[index];
                  return DeviceCard(
                    macAddress: device['mac'],
                    rssi: device['rssi'],
                  );
                },
              ),
    );
  }
}
