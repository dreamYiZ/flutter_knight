import 'package:flutter/material.dart';

class PendingPickupList extends StatelessWidget {
  const PendingPickupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual number of tasks
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.pending),
          title: Text('Pending Pickup Task ${index + 1}'),
          subtitle: Text('Details for pending pickup task ${index + 1}'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Handle task tap
          },
        );
      },
    );
  }
}