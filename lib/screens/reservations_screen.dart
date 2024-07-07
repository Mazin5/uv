import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationsScreen extends StatelessWidget {
  final CollectionReference reservations =
      FirebaseFirestore.instance.collection('reservations');

  ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: reservations.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var reservation = data[index];
              return ReservationCard(
                customerName: reservation['customerName'],
                reservationDate: reservation['reservationDate'],
                status: reservation['status'],
              );
            },
          );
        },
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final String customerName;
  final String reservationDate;
  final String status;

  const ReservationCard({
    super.key,
    required this.customerName,
    required this.reservationDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: $reservationDate',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 16.0,
                color: status == 'Confirmed'
                    ? Colors.green
                    : status == 'Pending'
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
