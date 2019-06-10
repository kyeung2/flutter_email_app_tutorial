import 'package:emailapp/ContactManager.dart';
import 'package:emailapp/Provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);
    return Chip(
      label: StreamBuilder<int>(
        stream: manager.contactCounter,
        builder: (context, snapshot) {
          return Text(
            // ?? means "if null"
            (snapshot.data ?? 0).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        },
      ),
      backgroundColor: Colors.red,
    );
  }
}
