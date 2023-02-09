import 'package:flutter/material.dart';
import 'package:flutter_local_auth/screens/success_screen.dart';
import 'package:flutter_local_auth/service/local_auth_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Auth status ${isSuccess ? 'Success' : 'failed'} '),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final auth = await LocalAuth.authenticate();
                    isSuccess = auth;
                    setState(() {});
                    if (isSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessScreen()));
                    }
                  },
                  child: Text('Auth'))
            ],
          ),
        ));
  }
}