import 'package:flutter/material.dart';
import 'package:login_signup/Authentication/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final username= TextEditingController();
  final password= TextEditingController();

  bool isVisible = false;

  final formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.asset("assets/images/video-calling.png", height: 300,),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurple.withValues(alpha: .1),
                    ),
                    child: TextFormField(
                      controller: username,
                      validator: (value){
                        if(value!.isEmpty){
                          return "username is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurple.withValues(alpha: .1),
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value){
                        if(value!.isEmpty){
                          return "password is required";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              },
                              icon: Icon(isVisible?Icons.visibility:Icons.visibility_off)
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurple
                    ),
                    child: TextButton(
                        onPressed: (){
                          if(formkey.currentState!.validate()){

                          }
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      }, child: Text("Sign Up"))
                    ],
                  )
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
