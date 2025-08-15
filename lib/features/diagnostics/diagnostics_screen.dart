import 'package:flutter/material.dart';

class DiagnosticsScreen extends StatelessWidget {
  const DiagnosticsScreen({super.key});

  Color getValueColor(String label, String value) {
    double? numericValue = double.tryParse(
      value.replaceAll(RegExp(r'[^0-9.]'), ''),
    );
    if (numericValue == null) return Colors.white;
    switch (label) {
      case 'RPM':
        if (numericValue < 1000) return Colors.green;
        if (numericValue < 3000) return Colors.orange;
        return Colors.red;
      case 'Coolant Temp':
        if (numericValue < 90) return Colors.green;
        if (numericValue < 105) return Colors.orange;
        return Colors.red;
      case 'Throttle Position':
        if (numericValue < 30) return Colors.green;
        if (numericValue < 70) return Colors.orange;
        return Colors.red;
      case 'Fuel Trim':
        if (numericValue.abs() <= 5) return Colors.green;
        if (numericValue.abs() <= 10) return Colors.orange;
        return Colors.red;
      case 'MAF Reading':
        if (numericValue < 10) return Colors.green;
        if (numericValue < 20) return Colors.orange;
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Widget buildDiagnosticRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: getValueColor(label, value)),
          ),
        ],
      ),
    );
  }

  Widget buildRemarksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 20),
        Text(
          'Remarks',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('- Engine running smoothly.'),
        Text('- No active or pending trouble codes.'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text('Static Diagnostics')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 16, 15, 15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildDiagnosticRow('Date', '24 Apr 2025'),
                      buildDiagnosticRow('Vehicle ID', '1HGCM82633A004352'),
                      buildDiagnosticRow('OBD Status', 'Connected'),
                      buildDiagnosticRow('RPM', '750'),
                      buildDiagnosticRow('Coolant Temp', '85°C'),
                      buildDiagnosticRow('Throttle Position', '14%'),
                      buildDiagnosticRow('Fuel Trim', '2.1%'),
                      buildDiagnosticRow('Injector Status', 'Enabled'),
                      buildDiagnosticRow('MAF Reading', '3.6 g/s'),
                      buildDiagnosticRow('Engine Load', '29%'),
                      buildDiagnosticRow('Intake Air Temp', '37°C'),
                      buildRemarksSection(),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildDiagnosticRow('Date', '17 Apr 2025'),
                      buildDiagnosticRow('Vehicle ID', '1HGCM82633A004352'),
                      buildDiagnosticRow('Coolant Temp', '110°C'),
                      buildDiagnosticRow('RPM', '3200'),
                      buildDiagnosticRow('Coolant Temp', '110°C'),
                      buildDiagnosticRow('Throttle Position', '84%'),
                      buildDiagnosticRow('Fuel Trim', '15.3%'),
                      buildDiagnosticRow('Injector Status', 'Enabled'),
                      buildDiagnosticRow('MAF Reading', '22.5 g/s'),
                      buildDiagnosticRow('Engine Load', '92%'),
                      buildDiagnosticRow('Intake Air Temp', '57°C'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 20),
                          Text(
                            'Remarks',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('- Engine misfire detected.'),
                          Text(
                            '- High fuel trim values could indicate vacuum leak.',
                          ),
                          Text('- O2 sensor out of expected range.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
