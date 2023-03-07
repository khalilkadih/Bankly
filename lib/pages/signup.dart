import 'package:flutter/material.dart';

import '../shared/constants/color.dart';
import '../shared/customiserTextFields.dart';
import 'login.dart';


class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(33.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const MyTextField(
                        inputType: TextInputType.text,
                        isPassword: false,
                        placeholder: "Enter you user name :"),
                    const SizedBox(
                      height: 15,
                    ),
                    const MyTextField(
                        inputType: TextInputType.text,
                        isPassword: false,
                        placeholder: "Enter you Email :"),
                    const SizedBox(
                      height: 30,
                    ),
                    const MyTextField(
                        inputType: TextInputType.text,
                        isPassword: true,
                        placeholder: "Enter you Password :"),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(BTNgreen),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () {
                              // Within the `FirstScreen` widget
                                // Navigate to the second screen using a named route.
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context)=> const Login(),
                                )
                                );

                            },
                            child: const Text("Sign in ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ))),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
