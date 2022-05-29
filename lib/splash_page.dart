import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool initied = false;

  @override
  void initState() {
    changeSizeWidget();
    super.initState();
  }

  changeSizeWidget() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        initied = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FittedBox(
          fit: BoxFit.none,
          child: AnimatedContainer(
            height: !initied ? 100 : MediaQuery.of(context).size.height * 2,
            width: !initied ? 100 : MediaQuery.of(context).size.height * 2,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.height),
              ),
            ),
            child: Center(
              child: AnimatedOpacity(
                opacity: !initied ? 1 : 0,
                duration: const Duration(seconds: 3),
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  child: const FlutterLogo(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
