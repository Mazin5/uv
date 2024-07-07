import 'package:flutter/material.dart';
import 'update_service_screen.dart'; // Import the update screen

class MyServiceScreen extends StatelessWidget {
  final Hall hall = Hall(
    name: 'Grand Ballroom',
    description:
        'A spacious hall with elegant decor, perfect for large events.',
    address: '123 Main St, Anytown, USA',
    phoneNumber: '(123) 456-7890',
    imageUrl:
        'https://i0.wp.com/www.frosted-saddle.com/wp-content/uploads/2020/06/Wedding-Food-Ideas-Your-Guests-Will-Love-21.jpg?fit=1000%2C667&ssl=1',
  );

  MyServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(hall.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              hall.name,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              hall.description,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Address: ${hall.address}',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Phone: ${hall.phoneNumber}',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateServiceScreen(hall: hall)),
                );
              },
              child: const Text('Want to update?'),
            ),
          ],
        ),
      ),
    );
  }
}

class Hall {
  final String name;
  final String description;
  final String address;
  final String phoneNumber;
  final String imageUrl;

  Hall({
    required this.name,
    required this.description,
    required this.address,
    required this.phoneNumber,
    required this.imageUrl,
  });
}
