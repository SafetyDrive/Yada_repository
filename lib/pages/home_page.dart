import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Insurance Premium Card
          Card(
            elevation: 2,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Month Selection Row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back),
                      Text('June 2024'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Premium Info
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('June 2024'),
                          Text('Insurance Premium'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '4,321 JPY',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '-123.45',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Graph Placeholder
                  Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text('Graph Placeholder'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Car Icons Row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('20'),
                      Text('21'),
                      Text('22'),
                      Text('23'),
                      Text('24'),
                      Text('25'),
                      Text('26'),
                      Icon(Icons.directions_car, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Map Card
          Card(
            elevation: 2,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Map Placeholder'),
                  Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text('Map Image'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Accelerometer Sensor Section
          const Card(
            elevation: 2,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('加速度センサー'),
                  SizedBox(height: 10),
                  Text('X軸: 〇〇.〇〇〇〇'),
                  Text('Y軸: 〇〇.〇〇〇〇'),
                  Text('Z軸: 〇〇.〇〇〇〇'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
