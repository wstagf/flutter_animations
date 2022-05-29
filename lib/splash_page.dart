import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool initied = false;
  double sizeRadius = 50.0;

  @override
  void initState() {
    changeSizeWidget();
    super.initState();
  }

  changeSizeWidget() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        initied = true;
        sizeRadius = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          height: !initied ? 100 : MediaQuery.of(context).size.height,
          width: !initied ? 100 : MediaQuery.of(context).size.width,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(sizeRadius),
              ),
            ),
            child: Center(
              child: AnimatedOpacity(
                opacity: !initied ? 1 : 0,
                duration: const Duration(seconds: 3),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: FlutterLogo(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
