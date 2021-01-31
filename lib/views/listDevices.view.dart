import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ListDevices extends StatefulWidget {
  ListDevices({Key key}) : super(key: key);

  @override
  _ListDevicesState createState() => _ListDevicesState();
}

class _ListDevicesState extends State<ListDevices> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = [];

  _ListDevicesState();
  @override
  Widget build(BuildContext context) {
    getDevices();

    return Scaffold(
      appBar: AppBar(
        title: Text("Scooter info"),
      ),
      body: new Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: this.devices.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(this.devices[index].name),
                );
              })
        ],
      ),
    );
  }

  Future<dynamic> getDevices() async {
    List<BluetoothDevice> _devices = [];

    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        _devices.add(r.device);
      }

      setState(() {
        this.devices = _devices;
      });
    });

    /// Stop scanning
    flutterBlue.stopScan();
  }
}
