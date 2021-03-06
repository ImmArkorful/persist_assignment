import 'package:flutter/material.dart';
import 'package:plant/User.dart';
import 'package:plant/database.dart';
import 'package:plant/dbOperations.dart';
import 'package:plant/form_field.dart';
import 'package:plant/main.dart';
import 'package:plant/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            image: AssetImage('images/mathematics.jpg'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.42),
                child: Image.asset(
                  'images/calculating.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                            fontSize: 42,
                            color: Color.fromARGB(255, 199, 199, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Login to my account',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 223, 223, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      formField(context, 'Email/Username', (value) {
                        setState(() => email = value);
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color.fromARGB(85, 223, 223, 0)
                                    .withOpacity(0.2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 223, 223, 0),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Opacity(
                                          opacity: 0.3,
                                          child: Icon(Icons.remove_red_eye)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.02,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.panorama_fish_eye,
                                    color: Color.fromARGB(255, 223, 223, 0),
                                  ),
                                ),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 182, 194, 18),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Text('Forgot Password?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 182, 194, 18),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:
                                      const Color.fromARGB(255, 224, 235, 80)),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextButton(
                                  onPressed: () async {
                                    final db = await database().initalizeDB();

                                    var user =
                                        User(email: email, password: password);
                                    DBOperations(db).insertUser(user);
                                  },
                                  child: const Text('Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 224, 235, 80)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
