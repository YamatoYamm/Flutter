import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        title: "Currency Convertor",
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class _HomePageState extends State<HomePage> {
  var valoare;
  var rezultat = 0.0;
  final val = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convertor"),
      ),

      body: Column(
        children: [
          Image.asset('assets/images/bani.png'),
          TextFormField(
            controller: val,
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              hintText: "Enter Value",
              labelText: "Value",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                valoare = val.text;
                rezultat = double.parse(valoare).toPrecision(2) * 4.5;
              });
            },
            child: Text('CONVERT'),
          ),
          Text(
            '$rezultat',
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            )
          ),
        ],
      ),
    );
  }
}

