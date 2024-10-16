import 'package:flutter/material.dart';
import 'package:flutter_dicoding_new/bmi.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.bmiInterpretation});
  final String bmiResult;
  final String resultText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Result Calculation',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          // backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
              Expanded(
                flex: 10,
                child: ComponentWidget(
                  color: Colors.blue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.00,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 100.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiInterpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.only(top: 15.0),
                  width: double.infinity, // stretch to full width of the screen
                  height: 80.0,
                  child: const Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
