import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {

  Position? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    print(_currentPosition);
    if (mounted) { // Garante que o widget ainda existe
      setState(() {
        _isLoading = false; 
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_currentPosition == null) {
      return const Center(child: Text("Localização indisponível."));
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('GPS'),
        ),
        body: Column(
          children: [
            Container(
              child: TextButton(
                onPressed: () async{
                  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                }, 
                child: Text('Obter Posição')
            ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Container(
              child: Text(
                'Latitude: ${_currentPosition!.latitude.toStringAsFixed(4)}\n'
                'Longitude: ${_currentPosition!.longitude.toStringAsFixed(4)}',
                textAlign: TextAlign.center,
              )
            ),
          ],
        ),
      )
    );
  }
}