import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_home/components/room_card.dart';
import 'package:smart_home/res/assets.dart';

void main() {
  const Size cardSize = Size(160, 160);

  testWidgets(
    "RoomCard under Normal Conditions",
    (tester) async {
      await tester.binding.setSurfaceSize(cardSize);
      await tester.pumpWidget(
        const MaterialApp(
          home: RoomCard(
            roomName: "Bedroom",
            lights: 3,
            illustration: AssetImages.bedroom,
          ),
        ),
      );
      // To trigger frame rebuild after svg is successfully rendered
      await tester.pump();
      final roomNameFinder = find.text("Bedroom");
      final nLightsFinder = find.text("3 Lights");
      final illustrationFinder = find.byKey(const Key('illustration'));

      await expectLater(
          illustrationFinder, matchesGoldenFile('goldens/normal.png'));
      expect(roomNameFinder, findsOneWidget);
      expect(nLightsFinder, findsOneWidget);
      expect(illustrationFinder, findsOneWidget);
    },
  );

  testWidgets(
    "RoomCard with no illustration provided",
    (tester) async {
      await tester.binding.setSurfaceSize(cardSize);
      await tester.pumpWidget(
        const MaterialApp(
          home: RoomCard(
            roomName: "Bedroom",
            lights: 3,
          ),
        ),
      );
      // To trigger frame rebuild after svg is successfully rendered
      await tester.pump();
      final roomNameFinder = find.text("Bedroom");
      final nLightsFinder = find.text("3 Lights");
      final illustrationFinder = find.byKey(const Key('illustration'));

      await expectLater(
          illustrationFinder, matchesGoldenFile('goldens/no_ill.png'));
      expect(roomNameFinder, findsOneWidget);
      expect(nLightsFinder, findsOneWidget);
      expect(illustrationFinder, findsOneWidget);
    },
  );

  testWidgets(
    "RoomCard with veryy long room name",
    (tester) async {
      await tester.binding.setSurfaceSize(cardSize);
      await tester.pumpWidget(
        const MaterialApp(
          home: RoomCard(
            roomName: "My rooooooooooooooooooooom",
            lights: 1,
            illustration: AssetImages.outdoor,
          ),
        ),
      );
      // To trigger frame rebuild after svg is successfully rendered
      await tester.pump();
      final roomNameFinder = find.text("My rooooooooooooooooooooom");
      final nLightsFinder = find.text("1 Light");
      final illustrationFinder = find.byKey(const Key('illustration'));

      await expectLater(
          illustrationFinder, matchesGoldenFile('goldens/long_room.png'));
      expect(roomNameFinder, findsOneWidget);
      expect(nLightsFinder, findsOneWidget);
      expect(illustrationFinder, findsOneWidget);
    },
  );

  testWidgets(
    "RoomCard with no data",
    (tester) async {
      await tester.binding.setSurfaceSize(cardSize);
      await tester.pumpWidget(
        const MaterialApp(
          home: RoomCard(),
        ),
      );
      // To trigger frame rebuild after svg is successfully rendered
      await tester.pump();
      final roomNameFinder = find.text("Room");
      final nLightsFinder = find.text("1 Light");
      final illustrationFinder = find.byKey(const Key('illustration'));

      await expectLater(
          illustrationFinder, matchesGoldenFile('goldens/no_data.png'));
      expect(roomNameFinder, findsOneWidget);
      expect(nLightsFinder, findsOneWidget);
      expect(illustrationFinder, findsOneWidget);
    },
  );
}
