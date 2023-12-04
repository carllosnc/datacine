import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:datacine/main.dart' as app;

void main(List<String> args) {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  checkMovieFilter(WidgetTester widgetTester) async {
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text("Movies"));

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text("Discover movies"));

    await widgetTester.pumpAndSettle();

    expect(find.text("FILTER MOVIES"), findsOneWidget);
    expect(find.text("Year:"), findsOneWidget);
    expect(find.text("Language:"), findsOneWidget);
    expect(find.text("Genres:"), findsOneWidget);

    await widgetTester.tap(find.byIcon(Icons.close));
  }

  checkTVFilter(WidgetTester widgetTester) async {
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text("TV"));

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text("Discover TV Shows"));

    await widgetTester.pumpAndSettle();

    expect(find.text("FILTER TV SHOWS"), findsOneWidget);
    expect(find.text("Year:"), findsOneWidget);
    expect(find.text("Language:"), findsOneWidget);
    expect(find.text("Genres:"), findsOneWidget);
  }

  testWidgets("Check tabs", (widgetTester) async {
    app.main();

    await widgetTester.pumpAndSettle();

    expect(find.text("Movies"), findsOneWidget);
    expect(find.text("Trendings"), findsOneWidget);
    expect(find.text("TV"), findsOneWidget);
    expect(find.text("People"), findsOneWidget);

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text("Movies"));

    await widgetTester.pumpAndSettle();

    expect(find.text("Discover movies"), findsOneWidget);

    await widgetTester.tap(find.text("TV"));

    await widgetTester.pumpAndSettle();

    expect(find.text("Discover TV Shows"), findsOneWidget);

    await widgetTester.tap(find.text("People"));

    await widgetTester.pumpAndSettle();

    expect(find.text("Discover movies"), findsNothing);
    expect(find.text("Discover TV Shows"), findsNothing);

    await checkMovieFilter(widgetTester);
    await checkTVFilter(widgetTester);
  });
}
