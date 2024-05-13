import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget displays correct text', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MyWidget());

    // Verify that the text is displayed.
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
