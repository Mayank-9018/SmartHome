import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_home/components/light_card.dart';
import 'package:smart_home/models/light.dart';

void main() {
  List<Color> colors = const [
    Color(0xFFFFFFFF),
    Color.fromARGB(255, 251, 212, 94),
    Color.fromARGB(255, 255, 115, 115),
    Color.fromARGB(255, 108, 236, 123),
    Color.fromARGB(255, 122, 192, 236),
    Color.fromARGB(255, 224, 146, 238)
  ];
  testWidgets("Bulbs show correct color", (tester) async {
    for (var color in colors) {
      await tester.pumpWidget(
        LightCardTesterWidget(
          Light("Main Lights", 1.0, color),
        ),
      );
      expect(
        ((tester.firstWidget(find.byType(AnimatedContainer))
                    as AnimatedContainer)
                .decoration as BoxDecoration)
            .color,
        color,
      );
    }
  });

  testWidgets(
    "Bulbs show correct color according to brightness",
    (tester) async {
      for (var color in colors) {
        await tester.pumpWidget(
          LightCardTesterWidget(
            Light("Main Lights", 0.5, color),
          ),
        );
        expect(
          ((tester.firstWidget(find.byType(AnimatedContainer))
                      as AnimatedContainer)
                  .decoration as BoxDecoration)
              .color,
          color.withOpacity(0.5),
        );
      }
    },
  );

  testWidgets(
    "Correct bulb shadows",
    (tester) async {
      for (var color in colors) {
        await tester.pumpWidget(
          LightCardTesterWidget(
            Light("Main Lights", 1.0, color),
          ),
        );
        expect(
          ((tester.firstWidget(find.byType(AnimatedContainer))
                      as AnimatedContainer)
                  .decoration as BoxDecoration)
              .boxShadow!
              .first,
          BoxShadow(
            color: (color == colors[0] ? Colors.lightBlue.shade200 : color)
                .withOpacity(1.0),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4.0,
          ),
        );
      }
    },
  );

  testWidgets(
    "Bulb resonsive to Brightness slider",
    (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1200, 600);
      var light = Light("Main Lights", 1.0, colors[0]);
      await tester.pumpWidget(
        LightCardTesterWidget(light),
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      await tester.drag(find.byType(Slider), const Offset(-1, 0));
      await tester.pump();
      var bulbFinder = tester.firstWidget(find.byType(AnimatedContainer))
          as AnimatedContainer;
      expect(
        (bulbFinder.decoration as BoxDecoration).color,
        Colors.white.withOpacity(0.4961832061068702),
      );
      expect(
        (bulbFinder.decoration as BoxDecoration).boxShadow!.first,
        BoxShadow(
          color: Colors.lightBlue.shade200.withOpacity(0.4961832061068702),
          offset: const Offset(0, 4),
          blurRadius: 10,
          spreadRadius: 4.0,
        ),
      );
    },
  );

  testWidgets(
    "Bulb resonsive to color change",
    (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1200, 650);
      var light = Light("Main Lights", 1.0, colors[0], supportsColors: true);
      await tester.pumpWidget(
        LightCardTesterWidget(light),
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      await tester.tap((find.byKey(const Key('color-dots'))).at(3));
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      var bulbFinder = tester.firstWidget(find.byType(AnimatedContainer))
          as AnimatedContainer;
      expect(
        (bulbFinder.decoration as BoxDecoration).color,
        colors[3],
      );
      expect(
        (bulbFinder.decoration as BoxDecoration).boxShadow!.first,
        BoxShadow(
          color: colors[3],
          offset: const Offset(0, 4),
          blurRadius: 10,
          spreadRadius: 4.0,
        ),
      );
    },
  );
}

class LightCardTesterWidget extends StatefulWidget {
  final Light light;
  const LightCardTesterWidget(this.light, {Key? key}) : super(key: key);

  @override
  State<LightCardTesterWidget> createState() => _LightCardTesterWidgetState();
}

class _LightCardTesterWidgetState extends State<LightCardTesterWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: LightCard(
          widget.light,
          animationController: animationController,
        ),
      ),
    );
  }
}
