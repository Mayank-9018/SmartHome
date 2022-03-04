import 'package:flutter/material.dart';
import 'package:smart_home/res/text_styles.dart';

import '../models/light.dart';

class LightCard extends StatelessWidget {
  final Light light;
  const LightCard(this.light, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                style: lightNameStyle,
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
          const SizedBox(height: 10),
          BrightnessSlider(light)
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.dark_mode_outlined, color: Colors.blue.shade900),
        Expanded(
          child: Slider(
            value: widget.light.brightness,
            onChanged: updateBrightness,
          ),
        ),
        Icon(Icons.light_mode, color: Colors.blue.shade900),
      ],
    );
  }

  void updateBrightness(double newVal) {
    setState(() {
      widget.light.updateBrightness(newVal);
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
