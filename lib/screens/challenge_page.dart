import 'package:flutter/material.dart';

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});

  @override
  State<SecondChallenge> createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge> {
  List<double> nilai = [100, 100, 255];
  double ratna(double val) {
    return val > 200 ? 200 : val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: "Width",
            decoration: const BoxDecoration(color: Colors.red),
            preferBelow: false,
            child: Slider(
              value: nilai[0],
              divisions: 500,
              max: 500,
              label: "${nilai[0].toInt()}",
              onChanged: (val) {
                setState(
                  () {
                    nilai[0] = val;
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Tooltip(
            message: "Height",
            decoration: const BoxDecoration(color: Colors.red),
            preferBelow: false,
            child: Slider(
              value: nilai[1],
              divisions: 500,
              max: 500,
              label: "${nilai[1].toInt()}",
              onChanged: (val) {
                setState(
                  () {
                    nilai[1] = val;
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Tooltip(
            message: "Opacity",
            decoration: const BoxDecoration(color: Colors.red),
            preferBelow: false,
            child: Slider(
              value: nilai[2],
              divisions: 255,
              max: 255,
              label: "${nilai[2].toInt()}",
              onChanged: (val) {
                setState(
                  () {
                    nilai[2] = val;
                  },
                );
              },
            ),
          ),
          Tooltip(
            message: "box nilai",
            decoration: const BoxDecoration(color: Colors.red),
            preferBelow: false,
            child: Container(
              width: ratna(nilai[0]),
              height: ratna(nilai[1]),
              color: Color.fromARGB(nilai[2].toInt(), 0, 0, 255),
            ),
          ),
        ],
      ),
    );
  }
}
