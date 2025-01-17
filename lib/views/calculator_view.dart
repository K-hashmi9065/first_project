import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          CalculatorDisplay(
              hint: "Enter first Number", controller: displayOneController),
          const SizedBox(
            height: 20,
          ),
          CalculatorDisplay(
              hint: "Enter Second Number", controller: displayTwoController),
          const SizedBox(
            height: 20,
          ),
          Text(z.toString(),
              style:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                 setState(() {
                    z = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                 });
                  
                },
                backgroundColor: Colors.deepOrange,
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                    setState(() {
                    z = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                 });
                },
                backgroundColor: Colors.deepOrange,
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                   setState(() {
                    z = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                 });
                },
                backgroundColor: Colors.deepOrange,
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                     setState(() {
                    z = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                 });
                },
                backgroundColor: Colors.deepOrange,
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
           
          ),
          const SizedBox(height: 15,),
            FloatingActionButton.extended(
                onPressed: () {
                    x = 0;
                    y = 0;
                    z = 0;
                    displayOneController.clear();
                    displayTwoController.clear();
                },
                backgroundColor: Colors.deepOrange,
                label: const Text('Clear'),
              ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter a Number",
    required this.controller,
  });
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 4.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          )),
    );
  }
}
