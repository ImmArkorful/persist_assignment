import 'package:flutter/material.dart';
import 'package:plant/login.dart';
import 'package:plant/register.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/teemy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'The best app for your plants',
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.04),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Sign Up',
                      style: TextStyle(
                          color: Color(0xff2EB886),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xff2EB886)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
