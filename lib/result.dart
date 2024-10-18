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
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;

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
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: isLandscape ? 3 : 7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          child: const Text(
                            'Your Result',
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          color: Colors.white,
                          child: ComponentWidget(
                            color: Colors.white,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  resultText.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.00,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  bmiResult,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 100.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  bmiInterpretation,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.only(top: 15.0),
                    width:
                        double.infinity, // stretch to full width of the screen
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
                ),
              )
            ],
          ),
        ));
  }
}
