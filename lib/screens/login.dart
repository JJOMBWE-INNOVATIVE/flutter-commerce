
import 'package:commerce/screens/signup.dart';
import 'package:commerce/widgets/changescreen.dart';
import 'package:commerce/widgets/myButton.dart';
import 'package:commerce/widgets/mytextformField.dart';
import 'package:commerce/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool obserText = true;

class _LoginState extends State<Login> {


void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form?.validate() == true) {
    print("Yes");
  } else {
    print("No");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
       margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      MyTextFormField(
                         name: "Email",
                         validator: (value) {
                          if (value == null) {
                            return "Please enter a Email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email is Invalid";
                          }
                          return ""; 
                        },
                         ),
                         PasswordTextFormField(
                           onTap: (){
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                           name: "Password", 
                           obserText: obserText,
                           validator:(value) {
                          if (value == null) {
                            return "Please enter Password";
                          } else if (value.length < 8) {
                            return "Password too short";
                          }
                          return ""; 
                        },
                           ),
                        MyButton(
                          name: "Login",
                         onPressed: (){
                            validation();
                         }),
                         ChangeScreen(
                          name:"SignUp",
                          whichAccount: "I Have No Account!",
                          onTap: (){
                            Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=>const SignUp(),
                            ),
                            );
                          },
                         ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

