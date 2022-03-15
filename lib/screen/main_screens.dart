import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/main-page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF4FD3C4),
              Color(0xFF488FB1),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/s.png',
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),

              TextButton(onPressed: (){}, child:const Text('LogOut',style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
