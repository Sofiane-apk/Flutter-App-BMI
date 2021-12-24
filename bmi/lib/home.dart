import 'dart:math';

import 'package:bmi/results.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int Weight = 55;
  int Age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1box(context, 'Male'),
                    const SizedBox(width: 15),
                    m1box(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                      
                        Text('Height',
                            style: Theme.of(context).textTheme.headline1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightVal.toStringAsFixed(0),
                                style: Theme.of(context).textTheme.headline1),
                            Text(' cm',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Slider(
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          min: 90,
                          max: 220,
                          value: heightVal,
                          onChanged: (newValue) {
                           setState(() {
                              heightVal = newValue;
                           });
                          },
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2box(context, 'Weight'),
                    const SizedBox(width: 15),
                    m2box(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blueAccent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = (Weight) / pow((heightVal) / 100, 2);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Result(result: result, IsMale: isMale, age: Age);
                    },
                  ));
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Expanded m1box(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = (type == 'Male') ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (isMale && type == 'Male') || (!isMale && type == 'Female')
              ? Colors.blue
              : Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'Male' ? Icons.male : Icons.female,
              size: 90,
            ),
            SizedBox(height: 15),
            Text(
              type == 'Male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    ));
  }

  Expanded m2box(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'Age' ? 'Age' : 'Weight',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 10),
          Text(
            type == 'Age' ? '$Age' : '$Weight kg',
            style: Theme.of(context).textTheme.headline1,
          ),
         // SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: type == 'Age' ? 'Age--' : 'Weight--',
                onPressed: () {
                  setState(() => type == 'Age' ? Age-- : Weight--);
                },
                child: Icon(Icons.remove),
                mini: true,
                backgroundColor: Colors.blue,
              ),
              FloatingActionButton(
                heroTag: type == 'Age' ? 'Age++' : 'Weight++',
                onPressed: () {
                  setState(() => type == 'Age' ? Age++ : Weight++);
                },
                child: Icon(Icons.add),
                mini: true,
                backgroundColor: Colors.blue,
              )
            ],
          )
        ],
      ),
    ));
  }
}
