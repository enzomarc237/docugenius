// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:docugenius/main.dart';

void main() {
  testWidgets('DocuGenius Main Dashboard UI smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the TopToolbar is present.
    expect(find.byType(TopToolbar), findsOneWidget);

    // Verify that the LeftSidebar is present.
    expect(find.byType(LeftSidebar), findsOneWidget);

    // Verify that the RightSidebar is present.
    expect(find.byType(RightSidebar), findsOneWidget);

    // Verify that the main content area contains the "Welcome back" text.
    expect(find.text('Welcome back'), findsOneWidget);

    // Verify that there are three InfoCard widgets.
    expect(find.byType(InfoCard), findsNWidgets(3));
  });
}
