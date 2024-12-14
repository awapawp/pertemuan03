import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum 03',
      home: HokageSelector(), // Hapus 'const' dari sini
    );
  }
}

class HokageSelector extends StatefulWidget {
  @override
  _HokageSelectorState createState() => _HokageSelectorState();
}

class _HokageSelectorState extends State<HokageSelector> {
  String? selectedHokage;
  final Map<String, String> hokageImages = {
    'Hokage 1': 'https://example.com/hokage1.jpg',
    'Hokage 2': 'https://example.com/hokage2.jpg',
    'Hokage 3': 'https://example.com/hokage3.jpg',
    'Hokage 4': 'https://example.com/hokage4.jpg',
    'Hokage 5': 'https://example.com/hokage5.jpg',
  };

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hokage Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Hokage'),
              value: selectedHokage,
              items: hokageImages.keys.map((String hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedHokage = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imageUrl = hokageImages[selectedHokage];
                });
              },
              child: const Text('Tampilkan Gambar'),
            ),
            const SizedBox(height: 20),
            imageUrl != null
                ? Image.network(imageUrl!)
                : const Text('Pilih Hokage untuk melihat gambar'),
          ],
        ),
      ),
    );
  }
}
