import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 28),
          ),
          elevation: 0,
          backgroundColor: const Color(0xff090e21),
          centerTitle: true,
        ),
        body: const MyApp(),
        backgroundColor: const Color(0xff090e21),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {z
  double SliderValue = 120;
  var weightAgevalue=100;
  Color maleActiveColor = const Color(0xff1d1e33);
  Color femaleActiveColor = const Color(0xff1d1e33);
  Color genderActiveColor = const Color(0xff3b3c4d);
  double? answer;

  int weight = 60;
  int age = 28;


  Widget iconUi(
  {required IconData iconName,
    required String name,
    required Color color,
    required Color iconColor}) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      onTap: (){
        setState(() {
    if (name == "Male") {
    maleActiveColor = genderActiveColor;
    femaleActiveColor = const Color(0xff1d1e33);
    } else {
    femaleActiveColor = genderActiveColor;
    maleActiveColor = const Color(0xff1d1e33);
    }
    });
    },
      child: Container(
        decoration: BoxDecoration(
         color: color,
    borderRadius: BorderRadius.all(Radius.circular(15),
    ),
    ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.white,fontSize: 15),
            ),
            Text(
              "weightAgevalue",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(weightAgevalue>0){
                          (name=="Weight")? weight-- : age--;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff4c4f5e),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Ink(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if (weightAgevalue < 120) {
                          (name == "Weight") ? weight++ : age++;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff6e6f7a),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xfff67fa4),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
  ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(child: Row(
              children: [
                Expanded(child: iconUi(iconName: Icons.female,
                    name: "Female",
                    color: femaleActiveColor,
                    iconColor: Colors.white))
              ]
          ),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: iconUi(iconName: Icons.male,
              name: "Male",
              color: maleActiveColor,
              iconColor: Color(0xffeb1555),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff1d1e33),
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    )
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff626473),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${SliderValue.toInt()}",
                              style: TextStyle(fontSize: 50),
                            ),
                            TextSpan(
                                text: "  ", style: TextStyle(fontSize: 15)),
                            TextSpan(
                                text: "cm",
                                style: TextStyle(
                                  fontSize: 15, color: Color(0xff626473),
                                )
                            )
                          ]
                      ),
                    ),
                    Slider(
                        min: 0,
                        max: 250,
                        value: SliderValue,
                        activeColor: Color(0xfff5c1d1),
                        inactiveColor: Color(0xff555555),
                        onChanged: (val) {
                          setState(() {
                            SliderValue = val;
                          });
                        }
                    )
                  ],
                ),
              ))
            ],
          )),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: weightAgeUi(weightAgeUi: weight, name: "Weight"),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: weightAgeUi(weightAgeUi: age, name: "Age"),
                  )
                ],
              )
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              (answer != null) ? "${answer?.toStringAsFixed(2)}" : " ",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
            onTap: () {
              setState(() {
                answer =
                    ((weight) / ((SliderValue / 100) * (SliderValue / 100)))
                        .toDouble();
              });
            },
            child: Ink(
              decoration: BoxDecoration(
                  color: Color(0xffeb1555),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )
              ),
              child: Container(
                height: 55,
                alignment: Alignment.center,
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }}