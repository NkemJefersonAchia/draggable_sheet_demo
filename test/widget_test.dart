import 'package:flutter_test/flutter_test.dart';

import 'package:draggable_sheet_demo/main.dart';

void main() {
  testWidgets('sheet shows the ride list over the map', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('MAP'), findsOneWidget);
    expect(find.text('Ride 1'), findsOneWidget);
  });
}
