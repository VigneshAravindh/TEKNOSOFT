import 'package:flutter/material.dart';

class BMIResultPage extends StatelessWidget {
  final double bmi;
  final String category;
  final int age;
  final String gender;
  final double height;
  final double weight;

  const BMIResultPage({
    Key? key,
    required this.bmi,
    required this.category,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String instructions = '';

    if (bmi < 18.5) {
      instructions =
          'You are underweight. It\'s important to maintain a healthy diet to reach a normal weight.';
    } else if (bmi >= 18.5 && bmi < 25) {
      instructions = 'You have a normal weight. Keep up the good work!';
    } else if (bmi >= 25 && bmi < 30) {
      instructions =
          'You are overweight. Consider adjusting your diet and increasing physical activity.';
    } else {
      instructions =
          'You are obese. It\'s crucial to consult with a healthcare professional for guidance on weight management.';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.green,
            ], // Two color format for background
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white, // Color for the result box
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your BMI: ${bmi.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue, // Text color for result
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'BMI Category: $category',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue, // Text color for result
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.pink[100], // Color for gender box
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              'Gender: $gender',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black, // Text color for details
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.orange[100], // Color for age box
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              'Age: $age',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black, // Text color for details
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.green[100], // Color for height box
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              'Height: ${height.toStringAsFixed(1)} cm',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black, // Text color for details
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[100], // Color for weight box
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              'Weight: ${weight.toStringAsFixed(1)} kg',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black, // Text color for details
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 34.0),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Color for instruction box
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      instructions,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green, // Text color for instructions
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
