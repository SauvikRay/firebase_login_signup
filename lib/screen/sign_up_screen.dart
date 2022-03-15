import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key,}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
 
  final _lastNameFocuseNode = FocusNode();
  final _emailFocuseNode = FocusNode();
  final _passwordFocuseNode = FocusNode();
  final _confirmPasswordFocuseNode = FocusNode();
  

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        
       
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            colors: [
              Color(0xFF4FD3C4),
              Color(0xFF488FB1),
            ],
          )),
         
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
               
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/s.jpg',height: 100,width: 100,),
                  const SizedBox(height: 20,),
                   TextFormField(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(width: 2,color: Colors.white),
                      ),
                       enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.pinkAccent, width: 2.0),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width: 2,color:Colors.lime ),
                        ),
                        focusColor: Colors.lime,
                      labelText: 'First Name',
                      hintText: 'first name',
                        hintStyle:Theme.of(context).textTheme.headline1,
                      labelStyle:const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType:TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_lastNameFocuseNode);
                    },
                  ),
                  const SizedBox(height:20),
                  TextFormField(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(width: 2,color: Colors.white),
                      ),
                       enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.pinkAccent, width: 2.0),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width: 2,color:Colors.lime ),
                        ),
                        focusColor: Colors.lime,
                      labelText: 'Last name',
                      hintText: 'lase name',
                       hintStyle:Theme.of(context).textTheme.headline1,
                      labelStyle:const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.text,
                    focusNode: _lastNameFocuseNode,
                    textInputAction: TextInputAction.next,
                     onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_emailFocuseNode);
                    },
                  ),
                  const SizedBox(height:20),
                   TextFormField(
                    decoration:  InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(width: 2,color: Colors.white),
                      ),
                       enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.pinkAccent, width: 2.0),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width: 2,color:Colors.lime ),
                        ),
                        focusColor: Colors.lime,
                      labelText: 'Email',
                      hintText: 'test@gmail.com',
                       hintStyle:Theme.of(context).textTheme.headline1,
                      labelStyle:const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocuseNode,
                    textInputAction: TextInputAction.next,
                     onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_passwordFocuseNode);
                    },
                  ),
                 
                  const SizedBox(height:20),
                  TextFormField(
                    decoration:  InputDecoration(
                     
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.pinkAccent, width: 2.0),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width: 2,color:Colors.lime ),
                        ),
                        focusColor: Colors.lime,
                      labelText: 'Password',
                      hintText: '********',
                      
                      hintStyle:Theme.of(context).textTheme.headline1,
                      labelStyle:const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                    
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: _passwordFocuseNode,
                    textInputAction: TextInputAction.next,
                     onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_confirmPasswordFocuseNode);
                    },
            
                  ),
                      const SizedBox(height:20),
            
                    TextFormField(
                    decoration:  InputDecoration(
                     
                         enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.pinkAccent, width: 2.0),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width: 2,color:Colors.lime ),
                        ),
                        focusColor: Colors.lime,
                      labelText: 'Confirm Password',
                      hintText: '********',
                      
                      hintStyle:Theme.of(context).textTheme.headline1,
                      labelStyle:const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                    
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: _confirmPasswordFocuseNode,
                      textInputAction: TextInputAction.done,
            
                  ),
            
                  const SizedBox(height: 20,),
                  MaterialButton(
                onPressed: (){},
                child:const Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.deepOrangeAccent[400],
                elevation: 5.0,
                splashColor: Colors.white.withOpacity(0.4),
              ),
                  
                  
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}
