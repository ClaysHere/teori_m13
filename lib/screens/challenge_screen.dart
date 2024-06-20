import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  List<Map<String, dynamic>> tugas = [
    {"label": "Tugas 1", "status": false},
    {"label": "Tugas 2", "status": false},
    {"label": "Tugas 3", "status": false},
    {"label": "Tugas 4", "status": false},
  ];
  int tugasDone = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                tugas.add(
                    {"label": "Tugas ${1 + tugas.length}", "status": false});
              });
              tugasDone = List.from(tugas)
                  .where((product) => product["status"] == true)
                  .toList()
                  .length;
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            LinearProgressIndicator(
              value: tugasDone / tugas.length,
            ),
            ...tugas.map(
              (e) => ListTile(
                title: Text(e["label"]),
                trailing: Checkbox(
                  value: e["status"],
                  onChanged: (val) {
                    setState(() {
                      e["status"] = val;
                    });
                    tugasDone = List.from(tugas)
                        .where((product) => product["status"] == true)
                        .toList()
                        .length;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
