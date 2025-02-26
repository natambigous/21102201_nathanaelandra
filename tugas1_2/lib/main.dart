import 'package:flutter/material.dart';

int hitungFPB(int a, int b) {
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1.2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tugas 1.2 Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bil1 = 0;
  int bil2 = 0;
  int hasilFPB = 0;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  List<List<int>> array = [
    [for (int i = 1; i <= 4; i++) i * 6],
    [for (int i = 0; i < 5; i++) 3 + (i * 2)],
    [for (int i = 4; i < 10; i++) i * i * i],
    [for (int i = 0; i < 7; i++) 3 + (i * 7)]
  ];

  void calculateFPB() {
    setState(() {
      bil1 = int.tryParse(_controller1.text) ?? 0;
      bil2 = int.tryParse(_controller2.text) ?? 0;
      hasilFPB = hitungFPB(bil1, bil2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the array
              const Text(
                'Array:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var row in array)
                Text(
                  row.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 20),

              // Input fields for FPB calculation
              TextField(
                controller: _controller1,
                decoration: const InputDecoration(
                  labelText: 'Masukkan bilangan pertama',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: const InputDecoration(
                  labelText: 'Masukkan bilangan kedua',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateFPB,
                child: const Text('Hitung FPB'),
              ),
              const SizedBox(height: 20),
              Text(
                'FPB dari $bil1 dan $bil2 adalah: $hasilFPB',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}