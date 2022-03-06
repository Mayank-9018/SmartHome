import 'package:flutter/material.dart';
import 'package:smart_home/res/colors.dart';
import 'package:smart_home/res/text_styles.dart';

import '../models/light.dart';

bool darkTheme = false;

class LightCard extends StatelessWidget {
  final Light light;
  final AnimationController animationController;

  const LightCard(this.light, {Key? key, required this.animationController})
      : super(key: key);

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
          BrightnessSlider(light, animationController),
          if (light.supportsColors) ...[
            const SizedBox(height: 20),
            ColorPallete(light, animationController),
          ]
        ],
      ),
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  final Light light;
  final AnimationController animationController;
  const BrightnessSlider(this.light, this.animationController, {Key? key})
      : super(key: key);

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double currentValue = 0.0;
  late Tween<double> valuesTween;
  late final Animation<double> curvedAnimation;

  @override
  void initState() {
    widget.animationController.addListener(animateSlider);
    curvedAnimation = CurvedAnimation(
        parent: widget.animationController, curve: Curves.decelerate);
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
      currentValue = valuesTween.evaluate(curvedAnimation);
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
  final AnimationController animationController;
  const ColorPallete(this.light, this.animationController, {Key? key})
      : super(key: key);

  final List<Color> colors = const [
    Color(0xFFFFFFFF),
    Color.fromARGB(255, 251, 212, 94),
    Color.fromARGB(255, 255, 115, 115),
    Color.fromARGB(255, 108, 236, 123),
    Color.fromARGB(255, 122, 192, 236),
    Color.fromARGB(255, 224, 146, 238)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildDots());
  }

  List<Widget> buildDots() {
    double delay = 0.14;
    List<Widget> dots = [];
    for (int i = 0; i < colors.length; i++) {
      Animation<double> curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Interval(
          delay,
          1.0,
          curve: Curves.decelerate,
        ),
      );
      Color color = colors[i];
      dots.add(
        FadeTransition(
          opacity: curvedAnimation,
          child: SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
                    .animate(curvedAnimation),
            child: InkWell(
              onTap: () => light.updateColor(color),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey.shade700),
                ),
              ),
            ),
          ),
        ),
      );
      delay += 0.14;
    }
    return dots;
  }
}
