import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:battery_plus/battery_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hardware Info App',
      debugShowCheckedModeBanner: false,
      home: HardwareHome(),
    );
  }
}

class HardwareHome extends StatefulWidget {
  const HardwareHome({super.key});

  @override
  State<HardwareHome> createState() => _HardwareHomeState();
}

class _HardwareHomeState extends State<HardwareHome> {
  final Battery _battery = Battery();
  BatteryState _batteryState = BatteryState.unknown;
  int _batteryLevel = 0;
  String _lastKey = 'None';
  Offset _mousePosition = Offset.zero;
  double _brightness = 1.0;

  @override
  void initState() {
    super.initState();
    _initBatteryInfo();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
    RawKeyboard.instance.addListener(_handleKey);
  }

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      setState(() {
        _lastKey = event.logicalKey.keyLabel.isEmpty
            ? event.logicalKey.debugName ?? "Unknown"
            : event.logicalKey.keyLabel;
      });
    }
  }

  Future<void> _initBatteryInfo() async {
    final level = await _battery.batteryLevel;
    final status = await _battery.batteryState;

    setState(() {
      _batteryLevel = level;
      _batteryState = status;
    });
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
        });
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(title: const Text('Hardware Interaction')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  _buildInfoTile("🔋 Battery Level", "$_batteryLevel%"),
                  _buildInfoTile(
                      "🔌 Battery Status",
                      _batteryState
                          .toString()
                          .split('.')
                          .last), // For compatibility
                  _buildInfoTile("⌨ Last Key Pressed", _lastKey),
                  _buildInfoTile(
                    "🖱 Mouse Position",
                    "x: ${_mousePosition.dx.toStringAsFixed(1)}, y: ${_mousePosition.dy.toStringAsFixed(1)}",
                  ),
                  const SizedBox(height: 20),
                  Text(
                      "💡 Brightness Control (${(_brightness * 100).round()}%)"),
                  Slider(
                    value: _brightness,
                    min: 0.1,
                    max: 1.0,
                    onChanged: (value) {
                      setState(() {
                        _brightness = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Simulated brightness layer
          IgnorePointer(
            child: Container(
              color: Colors.black.withOpacity(1.0 - _brightness),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
