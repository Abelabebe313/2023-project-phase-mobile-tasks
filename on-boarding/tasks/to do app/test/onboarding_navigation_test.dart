// test/onboarding_navigation_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/screen/starter.dart';
import 'package:to_do_app/screen/home.dart';

void main() {
  testWidgets('Test Onboarding Page Navigation', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Starter(),
    ));

    // Verify that the Starter page (onboarding page) is displayed initially
    expect(find.byType(Starter), findsOneWidget);

    // Find and tap the onboarding button
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that we are navigated to the main To-Do list page (Home screen)
    expect(find.byType(Home), findsOneWidget);
  });
}
