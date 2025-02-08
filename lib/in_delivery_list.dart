import 'package:flutter/material.dart';

class InDeliveryList extends StatelessWidget {
  const InDeliveryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual number of tasks
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.delivery_dining),
          title: Text('In Delivery Task ${index + 1}'),
          subtitle: Text('Details for in delivery task ${index + 1}'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Handle task tap
          },
        );
      },
    );
  }
}