

import 'package:commerce/screens/login.dart';
import 'package:commerce/widgets/changescreen.dart';
import 'package:commerce/widgets/myButton.dart';
import 'package:commerce/widgets/mytextformField.dart';
import 'package:commerce/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool observeText = true;

class _SignUpState extends State<SignUp> {
  

void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form?.validate() == true) {
    print("Yes");
  } else {
    print("No");
  }
}

Widget _buildAllTextFormField(){
  return SizedBox(
    height: 330,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextFormField(
                        name: "UserName", 
                        validator: (value) {
                        if (value == null) {
                          return "Please enter a username";
                        } else if (value.length < 6) {
                          return "Username is too short";
                        }
                        return ""; 
                      },
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
                             MyTextFormField(
                              name: "Phone Number",
                               validator:(value) {
                        if (value == null) {
                          return "Please enter Phone Number";
                        } else if (value.length < 10) {
                          return "Phone number must be 10 digits";
                        }
                        return ""; 
                      },
                      ),
          ],
    ),
  );
}
// Bottom parts
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                width: MediaQuery.sizeOf(context).width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Register",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
             const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   _buildAllTextFormField(),
                    MyButton(
                          name: "SignUp",
                         onPressed: (){
                            validation();
                         }),
                         ChangeScreen(
                          name: "Login",
                           onTap: (){
                            Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=>const Login(),
                            ),
                            );
                           }, 
                           whichAccount: "I Have Already An Account!"
                           ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}