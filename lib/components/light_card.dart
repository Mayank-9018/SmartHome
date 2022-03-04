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
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: light.color == Colors.white
                                ? Colors.lightBlue.shade200
                                : light.color,
                            offset: const Offset(0, 8),
                            blurRadius: 12.0,
                            spreadRadius: 1.0),
                      ],
                      color: light.color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    height: 10,
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          BrightnessSlider(light.brightness)
        ],
      ),
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  final double value;
  const BrightnessSlider(this.value, {Key? key}) : super(key: key);

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  late double value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.dark_mode_outlined, color: Colors.blue.shade900),
        Expanded(
          child: Slider(
            value: value,
            onChanged: updateBrightness,
          ),
        ),
        Icon(Icons.light_mode, color: Colors.blue.shade900),
      ],
    );
  }

  void updateBrightness(double newVal) {
    setState(() {
      value = newVal;
    });
  }
}
