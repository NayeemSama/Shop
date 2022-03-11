import 'package:flutter/material.dart';

import '../utils/Routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String uname="";
  bool changeButton = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset('assets/images/Login.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10,),
                Text('Welcome $uname',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  onTap: (){
                    setState(() {
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter user name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: "Enter Username",
                    labelText: "Username",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    )
                  ),
                  onChanged: (value){
                    uname = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter password";
                    }
                    else if (value.length<6){
                      return "Password length at least 6 letters";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: "Enter Password",
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Material(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(changeButton? 50 : 8),
                  child: InkWell(
                    // splashColor: Colors.grey,
                    onTap: () => moveHome(context),
                    child: AnimatedContainer(
                      width: changeButton? 50 : 150,
                      height: changeButton? 50 : 50,
                      alignment: Alignment.center,

                      duration: Duration(milliseconds: 300),
                      child: changeButton?
                      Icon(Icons.done, color: Colors.white,) :
                      Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: changeButton? 0 : 20,
                        ),
                      ),
                    ),
                  ),
                )
                // ElevatedButton(
                //   onPressed: (){
                //     Navigator.pushNamed(context, Routes.homeRoute);
                //   },
                //   child: Text('LOGIN'),
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size(120.0, 50.0),
                //     primary: Colors.amber,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  moveHome(BuildContext context) async {
    if(formKey.currentState!.validate()){
      changeButton = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.homeRoute);
      setState(() {
        changeButton= false;
      });
    }
  }
}
