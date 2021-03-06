import 'package:bmi_calculator/services/calculator_brain.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/measuring_unit_widget.dart';
import 'package:bmi_calculator/widgets/reuable_card_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'results_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum Gender { male, female }
enum MeasuringUnit { imperial, metric }

class _HomeScreenState extends State<HomeScreen> {
  Gender selectedGender = Gender.male;
  MeasuringUnit measuringUnit = MeasuringUnit.imperial;

  int height = 36;
  int weightLbs = 160;
  int weightKg = 45;
  int age = 25;

  String imperialDigits(int input) {
    int feet = input ~/ 12;
    int inches = input % 12;
    return '$feet\' $inches\"';
  }

  @override
  Widget build(BuildContext context) {
    bool isImperial = measuringUnit == MeasuringUnit.imperial;
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: ReusableCardContent(
                        icon: FontAwesomeIcons.mars, text: 'MALE'),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: ReusableCardContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MeasuringUnitWidget(
                  label: 'Imperial',
                  color: isImperial ? kActiveCardColor : kInactiveCardColor,
                  onPress: () {
                    setState(() {
                      measuringUnit = MeasuringUnit.imperial;
                      height = 36;
                    });
                  },
                ),
              ),
              Expanded(
                child: MeasuringUnitWidget(
                  label: 'Metric',
                  color: isImperial ? kInactiveCardColor : kActiveCardColor,
                  onPress: () {
                    setState(() {
                      measuringUnit = MeasuringUnit.metric;
                      height = 91;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT', style: kLabelTextStyle),
                        isImperial
                            ? Text(
                                imperialDigits(height),
                                style: kNumberTextStyle,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(height.toString(),
                                      style: kNumberTextStyle),
                                  Text(' cm', style: TextStyle(fontSize: 25.0)),
                                ],
                              ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: isImperial
                                ? height.toDouble()
                                : height.toDouble(),
                            min: isImperial ? 36 : 91,
                            max: isImperial ? 84 : 213,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              isImperial
                                  ? weightLbs.toString()
                                  : weightKg.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(height: 50),
                            Text(
                              isImperial ? ' lbs' : ' kg',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: kActiveSelectedUnitColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  isImperial ? weightLbs-- : weightKg--;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  isImperial
                                      ? weightLbs = weightLbs - 10
                                      : weightKg = weightKg - 10;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  isImperial ? weightLbs++ : weightKg++;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  isImperial
                                      ? weightLbs = weightLbs + 10
                                      : weightKg = weightKg + 10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  age = age - 10;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  age = age + 10;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            text: 'CALCULATE',
            onPress: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                isImperial: isImperial,
                height: height,
                weight: isImperial ? weightLbs : weightKg,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    resultBMI: calculatorBrain.calculateBMI(),
                    resultInterp: calculatorBrain.getInterp(),
                    resultText: calculatorBrain.getResult(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
