import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({super.key});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/purple_bakcgorund.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Sizning natijangiz",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  30.width,
                ],
              ),
              Column(
                children: [
                  Text(
                    "Umumiy savollar: 12",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Tog'ri javoblar soni: 10",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "80%",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Lottie.asset('assets/lotties/Trophy.json'),
                  )
                ],
              ),
              CustomButton(
                fillColor: Colors.white,
                text: "Next",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
