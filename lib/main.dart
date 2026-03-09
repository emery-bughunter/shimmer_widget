import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shimmer widget ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 240, 240, 240),
        ),
        useMaterial3: true,
      ),
      home: const ShimmerDemoPage(),
    );
  }
}

class ShimmerDemoPage extends StatefulWidget {
  const ShimmerDemoPage({super.key});

  @override
  State<ShimmerDemoPage> createState() => _ShimmerDemoPageState();
}

class _ShimmerDemoPageState extends State<ShimmerDemoPage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //button for switching shimmer on or off
            Center(
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _isLoading = !_isLoading),
                icon: Icon(_isLoading ? Icons.visibility : Icons.hourglass_top),
                label: Text(_isLoading ? 'Show Content' : 'Show Shimmer'),
              ),
            ),
            const SizedBox(height: 24),

            _isLoading ? _buildShimmerList() : _buildRealContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(children: List.generate(4, (_) => _buildSkeletonCard())),
    );
  }

  Widget _buildSkeletonCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 14, color: Colors.white),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: 200,
                  color: const Color.fromARGB(169, 255, 255, 255),
                ),
                const SizedBox(height: 8),
                Container(height: 14, width: 120, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // real page content
  Widget _buildRealContent() {
    final items = [
      ('Flutter', '', Icons.flutter_dash),
      ('Dart', '', Icons.code),
      ('Shimmer', '', Icons.auto_awesome),
      ('Widgets', ' ', Icons.widgets),
    ];

    return Column(
      children: items
          .map(
            (item) => ListTile(
              leading: CircleAvatar(child: Icon(item.$3)),
              title: Text(item.$1),
              subtitle: Text(item.$2),
            ),
          )
          .toList(),
    );
  }
}
