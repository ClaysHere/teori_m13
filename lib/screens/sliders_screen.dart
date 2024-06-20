import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<double> warna = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: warna[0],
            divisions: 255,
            max: 255,
            label: "${warna[0].toInt()}",
            activeColor: Colors.red,
            thumbColor: Colors.red,
            onChanged: (val) {
              setState(() {
                warna[0] = val;
              });
            },
          ),
          Slider(
            value: warna[1],
            divisions: 255,
            max: 255,
            label: "${warna[1].toInt()}",
            activeColor: Colors.green,
            thumbColor: Colors.green,
            onChanged: (val) {
              setState(() {
                warna[1] = val;
              });
            },
          ),
          Slider(
            value: warna[2],
            divisions: 255,
            max: 255,
            label: "${warna[2].toInt()}",
            activeColor: Colors.blue,
            thumbColor: Colors.blue,
            onChanged: (val) {
              setState(() {
                warna[2] = val;
              });
            },
          ),
          Tooltip(
            message: "box warna",
            decoration: const BoxDecoration(color: Colors.red),
            preferBelow: false,
            child: Container(
              width: 200,
              height: 300,
              // color: Color.fromRGBO(
              //     warna[0].toInt(), warna[1].toInt(), warna[2].toInt(), 1),
              color: Color.fromARGB(
                  255, warna[0].toInt(), warna[1].toInt(), warna[2].toInt()),
            ),
          )
        ],
      ),
    );
  }
}
