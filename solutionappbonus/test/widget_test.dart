// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solutionappbonus/main.dart';


// Define a simple widget to display a list of items
class ItemListWidget extends StatelessWidget {
  final List<String> items;

  ItemListWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(items[index]));
      },
    );
  }
}

void main() {
  testWidgets('ItemListWidget displays the correct number of items', (WidgetTester tester) async {
    // Define the items to be displayed
    final items = ['Item 1', 'Item 2', 'Item 3'];
    
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: ItemListWidget(items: items)));

    // Verify the number of ListTile widgets rendered
    expect(find.byType(ListTile), findsNWidgets(items.length));
  });
}
