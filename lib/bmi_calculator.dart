import 'package:flutter/material.dart';
import 'bmi_result.dart';

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey,
        hintColor: Colors.pink,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        hintColor: Colors.pink,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  @override
  _BMIHomePageState createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  int _gender = 0; // 0 for male, 1 for female
  double _weight = 50.0;
  double _height = 160.0;
  int _age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              const Color.fromARGB(255, 206, 99, 224)
            ], // Custom color combination
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              _buildGenderSelection(),
              SizedBox(height: 20.0),
              _buildWeightSlider(),
              SizedBox(height: 20.0),
              _buildHeightSlider(),
              SizedBox(height: 20.0),
              _buildAgeSelector(),
              SizedBox(height: 20.0),
              _buildCalculateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGenderContainer(0, 'Boy', 'assets/boy.jpeg'),
        _buildGenderContainer(1, 'Girl', 'assets/girl.jpeg'),
      ],
    );
  }

  Widget _buildGenderContainer(int index, String genderText, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _gender = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _gender == index
              ? Colors.white.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }

  Widget _buildWeightSlider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Weight (kg): ${_weight.toStringAsFixed(1)}',
            style: TextStyle(
                fontSize: 18.0, color: Colors.white), // Add color to text
          ),
          Slider(
            value: _weight,
            min: 30.0,
            max: 150.0,
            divisions: 120,
            onChanged: (value) {
              setState(() {
                _weight = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeightSlider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Height (cm): ${_height.toStringAsFixed(1)}',
            style: TextStyle(
                fontSize: 18.0, color: Colors.white), // Add color to text
          ),
          Slider(
            value: _height,
            min: 100.0,
            max: 250.0,
            divisions: 150,
            onChanged: (value) {
              setState(() {
                _height = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAgeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _age--; // Decrease age
              });
            },
          ),
          Text(
            'Age: $_age',
            style: TextStyle(
                fontSize: 18.0, color: Colors.white), // Add color to text
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _age++; // Increase age
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton(
      onPressed: _calculateBMI,
      child: Text('Calculate BMI',
          style: TextStyle(
              color: Colors.black)), // Change button text color to black
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, // Change button background color to white
      ),
    );
  }

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);
    String bmiCategory;

    if (bmi < 18.5) {
      bmiCategory = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiCategory = 'Normal weight';
    } else if (bmi >= 25 && bmi < 30) {
      bmiCategory = 'Overweight';
    } else {
      bmiCategory = 'Obese';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BMIResultPage(
          bmi: bmi,
          category: bmiCategory,
          age: _age, // Pass age
          gender: _gender == 0 ? 'Male' : 'Female', // Pass gender
          height: _height, // Pass height
          weight: _weight, // Pass weight
        ),
      ),
    );
  }
}
