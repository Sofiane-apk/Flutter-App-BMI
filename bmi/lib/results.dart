import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {Key? key, required this.result, required this.IsMale, required this.age})
      : super(key: key);

  final double result;
  final bool IsMale;
  final int age;
  Color clr = Colors.white;
  String get resultPhrase {
    String resultText = '';

    if (result >= 30) {
      resultText = 'Obese';
      clr = Colors.red;
    } else if (result >= 25 && result < 30) {
      resultText = 'Overweight';
      clr = Colors.orange;
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
      clr = Colors.green;
    } else {
      resultText = 'Thin';
      clr = Colors.yellow;
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Result',
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender : ${IsMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Result : ${result.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Healthiness :',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              '$resultPhrase',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: clr,
              ),
            ),
            Text(
              'Age : $age',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ))));
  }
}
