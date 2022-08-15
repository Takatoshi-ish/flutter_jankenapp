// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_jankenapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that our counter starts at 0.
    expect(find.text('試合中'), findsOneWidget);
    expect(find.text('試合数：0試合目'), findsOneWidget);
    expect(find.text('✊'), findsNWidgets(3));
    expect(find.text('✌️'), findsOneWidget);
    expect(find.text('🖐'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byKey(const ValueKey('unit_one')));
    await tester.pump();
    expect(find.text('試合数：1試合目'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('unit_two')));
    await tester.pump();
    expect(find.text('試合数：2試合目'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('unit_three')));
    await tester.pump();
    expect(find.text('試合数：3試合目'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('unit_one')));
    await tester.pump();
    expect(find.text('試合数：4試合目'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('unit_two')));
    await tester.pump();
    expect(find.text('試合数：5試合目'), findsOneWidget);
    expect(find.text('試合中'), findsNothing);
    await tester.tap(find.byKey(const ValueKey('unit_three')));
    await tester.pump();
    expect(find.text('試合数：1試合目'), findsOneWidget);
  });
}
