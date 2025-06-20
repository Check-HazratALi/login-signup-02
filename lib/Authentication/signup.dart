
import 'package:flutter/material.dart';
import 'package:login_signup/Authentication/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final username= TextEditingController();
  final password= TextEditingController();
  final confirmpassword= TextEditingController();

  bool isVisible = false;
  bool isVisible2 = false;

  final formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ListTile(
                    title: Text(
                      "Register\nNew Account",
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold
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

                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurple.withValues(alpha: .1),
                    ),
                    child: TextFormField(
                      controller: confirmpassword,
                      validator: (value){
                        if(value!.isEmpty){
                          return "password is required";
                        }else if(password != confirmpassword){
                          return "password don't match";
                        }
                        return null;
                      },
                      obscureText: !isVisible2,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Comfirm Password",
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isVisible2=!isVisible2;
                              });
                            },
                            icon: Icon(isVisible2?Icons.visibility:Icons.visibility_off)
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
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      }, child: Text("Login"))
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
