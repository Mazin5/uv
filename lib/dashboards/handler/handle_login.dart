import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../user_dashboard.dart';
import '../vendor_dashboard.dart';
import '../admin_dashboard.dart';

void handleLogin(BuildContext context, User user) async {
  String role = await getUserRole(user.uid);
  if (role == 'user') {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserDashboard()));
  } else if (role == 'vendor') {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VendorDashboard()));
  } else if (role == 'admin') {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminDashboard()));
  }
}

Future<String> getUserRole(String uid) async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return snapshot['role'];
}
