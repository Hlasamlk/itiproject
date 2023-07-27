import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/components/mybuttons.dart';
import 'package:project/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController UserNamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Form(
        key: _formkey ,
        child: ListView(
          children: [ 
          const SizedBox(height: 20,),
          Container(
            
            width: 100,
            height: 100,
            child: 
          Image.asset("assets/login.png")
            
          ,),
          const SizedBox(height: 20,),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: TextFormField( 
              controller: UserNamecontroller,
              decoration: InputDecoration( labelText: "UserName" , labelStyle: TextStyle(color: Colors.grey.shade600) ,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50) , borderSide: BorderSide(
                    color: Colors.grey.shade400
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)
                )
              ),
              obscureText: false,
              validator:(value){
                if(value!.contains("@")){
                  return null;
                }else{
                  return "enter valid username";
                }
              },
            ),
          ),
            
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextFormField( 
              decoration: InputDecoration( labelText: "password" ,  labelStyle: TextStyle(color: Colors.grey.shade600) ,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50) , borderSide: const BorderSide(
                    color: Colors.white
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)
                ),
              ),
              obscureText: true,
              validator: (value) {
                if(value!.length < 8 ){
                  return "enter valid password";
                }
                return null;
              },
            ),
          ),
          
            
            
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
              'forgot password?',style: TextStyle(color: Colors.grey),
            ),
              ],
            ),
            
          ),
            
          MyCustomButtonState(
            label: "LOG IN",
            onPressed: () async {
              if(_formkey.currentState!.validate()){

                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('UserName', UserNamecontroller.text);


                Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  HomePage(
                //UserName: UserNamecontroller.text,
                )),
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('login done'))
                );
              }
            },
          ),

          MyCustomButtonState(
            label: " No Account? Sign Up ",
            onPressed: () {
                
            },
          ),    
        ]    
        ),
        ),
    );
  }
}



// decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter, colors: [
      //             Color(0x99213d47),
      //             Color(0xCC213d47),
      //             Color(0xBF213d47),
      //             Color(0xff213d47),
      //           ],
      //         )
      //       ),