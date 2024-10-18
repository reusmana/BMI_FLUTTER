import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_dicoding_new/result.dart';
import 'package:flutter_dicoding_new/calculate_bmi.dart';

Color activeColor = Colors.blue;
Color inactiveColor = Colors.blueGrey;

enum GenderType { male, female }

TextStyle kLabelTextStyle =
    const TextStyle(fontSize: 18.0, color: Colors.white);

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  GenderType? selectedGender = GenderType.male;
  int heights = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: isLandscape ? 3 : 7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: ComponentWidget(
                                color: activeColor,
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Weight', style: kLabelTextStyle),
                                    Text(
                                      weight.toString(),
                                      style: const TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RoudedIconButton(
                                          icons: Icons.remove,
                                          onPressed: () {
                                            setState(() {
                                              if (weight > 0) {
                                                weight--;
                                              }
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10.0),
                                        RoudedIconButton(
                                          icons: Icons.add,
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                                child: ComponentWidget(
                              color: activeColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Age', style: kLabelTextStyle),
                                  Text(
                                    age.toString(),
                                    style: const TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoudedIconButton(
                                        icons: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            if (age > 0) {
                                              age--;
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 10.0),
                                      RoudedIconButton(
                                        icons: Icons.add,
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        child: ComponentWidget(
                          color: activeColor,
                          cardChild: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'HEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      heights.toString(),
                                      style: const TextStyle(
                                          fontSize: 50.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'cm',
                                      style: kLabelTextStyle,
                                    )
                                  ],
                                ),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 3.0,
                                    activeTrackColor: Colors.white,
                                    inactiveTickMarkColor: Colors.blueGrey,
                                    inactiveTrackColor: Colors.blueGrey,
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 15.0),
                                    thumbColor: Colors.blueAccent,
                                    overlayShape: const RoundSliderOverlayShape(
                                        overlayRadius: 30.0),
                                    overlayColor: const Color(0x29EB1555),
                                  ),
                                  child: Slider(
                                    value: heights.toDouble(),
                                    min: 0.0,
                                    max: 220.0,
                                    onChanged: (double value) {
                                      setState(
                                        () {
                                          heights = value.toInt();
                                        },
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: ComponentWidget(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = GenderType.male;
                                  });
                                },
                                color: selectedGender == GenderType.male
                                    ? activeColor
                                    : inactiveColor,
                                cardChild: IconContent(
                                  label: 'MALE',
                                  icons: FontAwesomeIcons.mars,
                                ),
                              ),
                            ),
                            Flexible(
                              child: ComponentWidget(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = GenderType.female;
                                  });
                                },
                                color: selectedGender == GenderType.female
                                    ? activeColor
                                    : inactiveColor,
                                cardChild: IconContent(
                                  label: 'FEMALE',
                                  icons: FontAwesomeIcons.venus,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CalculationBrain calc =
                        CalculationBrain(height: heights, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  bmiResult: calc.calculate(),
                                  resultText: calc.getResult(),
                                  bmiInterpretation: calc.getInterpretation(),
                                )));
                  },
                  child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.only(top: 15.0),
                    width:
                        double.infinity, // stretch to full width of the screen
                    height: 80.0,
                    child: const Center(
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoudedIconButton extends StatelessWidget {
  final IconData? icons;
  final VoidCallback? onPressed;

  RoudedIconButton({this.icons, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      fillColor: Colors.blueAccent,
      child: Icon(
        icons,
        color: Colors.white,
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final String label;
  final IconData icons;
  IconContent({required this.label, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(height: 20.0),
        Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0)),
      ],
    );
  }
}

class ComponentWidget extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final GestureTapCallback? onPressed;

  ComponentWidget(
      {Key? key, required this.color, this.cardChild, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: cardChild,
          ),
        )
      ],
    );
  }
}
