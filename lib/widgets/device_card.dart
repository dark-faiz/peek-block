import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String macAddress;
  final int rssi;

  const DeviceCard({required this.macAddress, required this.rssi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: Icon(Icons.device_unknown, size: 40, color: Colors.blue),
        title: Text(
          'MAC: $macAddress',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('RSSI: $rssi', style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
