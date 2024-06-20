import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String gambar =
      "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg";

  bool isLoading = false;

  double _progressValue = 0.0;

  Future<void> _updateProgress() async {
    while (_progressValue < 10.0) {
      setState(() {
        _progressValue += 1.0;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void changeImage() async {
    setState(() {
      isLoading = true;
    });
    _updateProgress();
    await Future.delayed(const Duration(seconds: 9), () {
      setState(() {
        gambar =
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB8isxBZ3ck93RgPEv4hrVQxDteZvxjOn3Uw&s";
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "${_progressValue} / 10",
                textAlign: TextAlign.right,
              ),
            ),
          ),
          LinearProgressIndicator(
            value: _progressValue / 10,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: changeImage,
            child: const Text("Generate Image"),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                    // child: Text("Loading..."),
                  )
                : Image.network(
                    gambar,
                    fit: BoxFit.cover,
                  ),
          )
        ],
      ),
    );
  }
}
