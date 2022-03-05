import 'package:flutter/material.dart';
import 'package:smart_home/res/colors.dart';
import 'package:smart_home/res/text_styles.dart';

import '../models/light.dart';

bool darkTheme = false;
late AnimationController controller;

class LightCard extends StatelessWidget {
  final Light light;

  LightCard(this.light, {Key? key, required AnimationController animController})
      : super(key: key) {
    controller = animController;
  }

  @override
  Widget build(BuildContext context) {
    darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                light.name,
                style: lightNameStyle.copyWith(
                    color: darkTheme ? lightBlue : darkBlue),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/light_hold.png',
                    height: 40,
                  ),
                  LightBulb(light),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          BrightnessSlider(light),
          if (light.supportsColors) ...[
            const SizedBox(height: 20),
            ColorPallete(light),
          ]
        ],
      ),
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  final Light light;
  const BrightnessSlider(this.light, {Key? key}) : super(key: key);

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double currentValue = 0.0;
  late Tween<double> valuesTween;

  @override
  void initState() {
    controller.addListener(animateSlider);
    valuesTween = Tween(begin: 0.0, end: widget.light.brightness);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.dark_mode_outlined, color: darkTheme ? lightBlue : darkBlue),
        Expanded(
          child: Slider(
            value: currentValue,
            onChanged: updateBrightness,
          ),
        ),
        Icon(Icons.light_mode, color: darkTheme ? lightBlue : darkBlue),
      ],
    );
  }

  void updateBrightness(double newVal) {
    setState(() {
      currentValue = newVal;
      widget.light.updateBrightness(newVal);
    });
  }

  void animateSlider() {
    setState(() {
      currentValue = valuesTween.evaluate(controller);
    });
  }
}

class LightBulb extends StatefulWidget {
  final Light light;
  const LightBulb(this.light, {Key? key}) : super(key: key);

  @override
  State<LightBulb> createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  @override
  void initState() {
    widget.light.registerUpdateMethod(updateLight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: (widget.light.color == Colors.white
                    ? Colors.lightBlue.shade200
                    : widget.light.color)
                .withOpacity(widget.light.brightness),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4.0,
          ),
        ],
        color: widget.light.brightness <= 0.1
            ? Colors.grey
            : widget.light.color.withOpacity(widget.light.brightness),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      height: 10,
      width: 20,
    );
  }

  void updateLight() => setState(() {});
}

class ColorPallete extends StatelessWidget {
  final Light light;

  const ColorPallete(this.light, {Key? key}) : super(key: key);

  final List<Color> colors = const [ //TODO: Update colors to a softer shade
    Color(0xFFFFFFFF),
    Color.fromARGB(255, 255, 204, 51),
    Color.fromARGB(255, 255, 97, 97),
    Color.fromARGB(255, 75, 255, 81),
    Color.fromARGB(255, 86, 179, 255),
    Color.fromARGB(255, 236, 127, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors
          .map(
            (e) => GestureDetector(
              onTap: () => light.updateColor(e),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: e,
                  borderRadius: BorderRadius.circular(20.0),
                  border:
                      e == colors[0] ? Border.all(color: Colors.grey) : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
