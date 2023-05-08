import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = .5;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders & Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
                min: 0.3,
                max: 1,
                activeColor: AppTheme.primary,
                value: _sliderValue,
                onChanged: _sliderEnabled
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                      }
                    : null),
            // Checkbox(
            //     value: _sliderEnabled,
            //     onChanged: (value) {
            //       _sliderEnabled = value ?? true;
            //       setState(() {});
            //     }),
            //  Switch(
            //     value: _sliderEnabled,
            //     onChanged: (value) => setState(() {
            //           _sliderEnabled = value;
            //         })),
            CheckboxListTile(
                title: const Text('Enable slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value ?? true;
                    })),
            SwitchListTile(
                title: const Text('Enable slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value;
                    })),
            const AboutListTile(),
            Expanded(
                child: Opacity(
              opacity: _sliderValue,
              child: const SingleChildScrollView(
                child: Image(
                  image: NetworkImage(
                      'https://pbs.twimg.com/media/E3AX1sqVUAAIi4V.jpg:large'),
                  fit: BoxFit.contain,
                ),
              ),
            )),
          ],
        ));
  }
}
