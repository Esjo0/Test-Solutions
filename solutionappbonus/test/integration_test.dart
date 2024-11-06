// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Define a simple app with navigation
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tapping button navigates to new screen', (WidgetTester tester) async {
    // Define the main app
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Home Screen')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                tester.element(find.byType(ElevatedButton)),
                MaterialPageRoute(builder: (_) => SecondScreen()),
              );
            },
            child: Text('Go to Second Screen'),
          ),
        ),
      ),
    ));

    // Verify we are on the home screen
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Go to Second Screen'), findsOneWidget);

    // Tap the button
    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    // Verify we navigated to the second screen
    expect(find.text('Second Screen'), findsOneWidget);
  });
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(child: Text('Welcome to the second screen!')),
    );
  }
}
