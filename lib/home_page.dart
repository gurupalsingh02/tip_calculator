import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _billAmount = 0.0;
  double _tipPercentage = 15.0;

  void _setBillAmount(String value) {
    setState(() {
      _billAmount = double.parse(value);
    });
  }

  void _setTipPercentage(double value) {
    setState(() {
      _tipPercentage = value;
    });
  }

  double _calculateTipAmount() {
    return _billAmount * (_tipPercentage / 100.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tip Calculator',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Tip Calculator'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Enter the bill amount (in rupees): ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Bill Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: _setBillAmount,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Tip Percentage'),
                    Text('${_tipPercentage.toInt()}%'),
                  ],
                ),
              ),
              Slider(
                value: _tipPercentage,
                min: 0,
                max: 30,
                divisions: 30,
                onChanged: _setTipPercentage,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Tip Amount: ${_calculateTipAmount().toStringAsFixed(2)} (in rupees)',
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ));
  }
}
