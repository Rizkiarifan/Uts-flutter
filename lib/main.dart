import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motorcycle Sales',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Motorcycle {
  final String name;
  final String brand;
  final int price;
  final String imageUrl;

  Motorcycle(
      {required this.name,
      required this.brand,
      required this.price,
      required this.imageUrl});
}

class MotorcycleListPage extends StatelessWidget {
  final List<Motorcycle> motorcycles = [
    Motorcycle(
        name: 'Pcx',
        brand: 'Honda',
        price: 20000000,
        imageUrl: 'assets/images/honda pcx.png'),
    Motorcycle(
        name: 'Scoopy',
        brand: 'Honda',
        price: 30000000,
        imageUrl: 'assets/images/honda scoopy.png'),
    Motorcycle(
        name: 'Scooter',
        brand: 'Honda',
        price: 40000000,
        imageUrl: 'assets/images/honda scooter.png'),
    Motorcycle(
        name: 'Vario',
        brand: 'Honda',
        price: 25000000,
        imageUrl: 'assets/images/honda vario.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motorcycle Sales'),
      ),
      body: ListView.builder(
        itemCount: motorcycles.length,
        itemBuilder: (context, index) {
          final motorcycle = motorcycles[index];
          return ListTile(
            leading: Image.network(motorcycle.imageUrl),
            title: Text(motorcycle.name),
            subtitle: Text(motorcycle.brand),
            trailing: Text('\$${motorcycle.price.toString()}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MotorcycleDetailPage(motorcycle: motorcycle),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MotorcycleDetailPage extends StatelessWidget {
  final Motorcycle motorcycle;

  MotorcycleDetailPage({required this.motorcycle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(motorcycle.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                motorcycle.imageUrl,
                scale: 2,
              ),
              SizedBox(height: 16),
              Text(motorcycle.name, style: TextStyle(fontSize: 24)),
              Text(motorcycle.brand, style: TextStyle(fontSize: 18)),
              Text('\$${motorcycle.price.toString()}',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
