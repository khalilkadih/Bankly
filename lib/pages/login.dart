import 'package:bankly/pages/signup.dart';
import 'package:flutter/material.dart';

import '../shared/constants/color.dart';
import '../shared/customiserTextFields.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const MyTextField(
                    inputType: TextInputType.emailAddress,
                    isPassword: false,
                    placeholder: "Enter you Email :"),
                const SizedBox(
                  height: 15,
                ),
                const MyTextField(
                    inputType: TextInputType.text,
                    isPassword: true,
                    placeholder: "Enter you Password :"),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?",style:
                    TextStyle(
                        color: Colors.black,
                        fontSize: 15),

                    ),
                    TextButton(
                        onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Signup()));
                        },
                        child: const Text("Sign up ",
                            style: TextStyle(
                                color:
                                Colors.black,
                              fontSize: 15,
                            )
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
