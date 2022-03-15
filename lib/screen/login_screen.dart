import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_up_login/screen/main_screens.dart';
import 'package:sign_up_login/screen/sign_up_screen.dart';
import 'package:sign_up_login/widget/text_input_form_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/login';
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocuseNode = FocusNode();
  final _passwordFocuseNode = FocusNode();
  //controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //calling Firebase
  final _auth = FirebaseAuth.instance;

//login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userId) {
        print(email);
        print(password);
        Fluttertoast.showToast(
          msg: "Login Successfull",
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color(0xFF4FD3C4).withOpacity(0.6),
              const Color(0xFF488FB1).withOpacity(0.8),
            ],
          )),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/s.png',
                  color: const Color(0xFFFFFFFF),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide:
                //           const BorderSide(width: 2, color: Colors.white),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: const BorderSide(
                //           color: Colors.pinkAccent, width: 2.0),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide:
                //           const BorderSide(width: 2, color: Colors.lime),
                //     ),
                //     focusColor: Colors.lime,
                //     labelText: 'Email',
                //     hintText: 'test@gmail.com',
                //     hintStyle: Theme.of(context).textTheme.headline1,
                //     labelStyle:
                //         const TextStyle(fontSize: 20, color: Colors.white),
                //   ),
                //   style: Theme.of(context).textTheme.headline2,
                //   keyboardType: TextInputType.emailAddress,
                //   controller: _emailController,
                //   focusNode: _emailFocuseNode,
                //   textInputAction: TextInputAction.next,
                //   onFieldSubmitted: (_) {
                //     FocusScope.of(context).requestFocus(_passwordFocuseNode);
                //   },
                //   onSaved: (value){
                //     _emailController.value;
                //   },
                // ),

                TextInputField(
                  labelText: 'Email',
                  hintText: 'test@gmail.com',
                  focusNode: _emailFocuseNode,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocuseNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Email';
                    }
                    //reg Expression
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please enter your valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _emailController.value;
                  },
                ),
                const SizedBox(height: 20),

                TextInputField(
                  labelText: 'Password',
                  hintText: 'P@sw0rd',
                  focusNode: _passwordFocuseNode,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  obscuringCharacter: '*',
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return 'Password Required';
                    }
                    if (!regex.hasMatch(value)) {
                      return 'Please enter valid password(minimum 6 Character)';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _passwordController.value;
                  },
                ),

                // TextFormField(
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: const BorderSide(
                //           color: Colors.pinkAccent, width: 2.0),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide:
                //           const BorderSide(width: 2, color: Colors.lime),
                //     ),
                //     focusColor: Colors.lime,
                //     labelText: 'Password',
                //     hintStyle: Theme.of(context).textTheme.headline1,
                //     labelStyle:
                //         const TextStyle(fontSize: 20, color: Colors.white),
                //   ),
                //   obscureText: true,
                //   obscuringCharacter: '*',
                //   style: Theme.of(context).textTheme.headline2,
                //   keyboardType: TextInputType.visiblePassword,
                //   focusNode: _passwordFocuseNode,
                //   textInputAction: TextInputAction.done,
                //   controller: _passwordController,
                //   onSaved: (value){
                //     _passwordController.value;
                //   },
                // ),

                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    signIn(_emailController.text, _passwordController.text);
                  },
                  child: const Text(
                    'LogIn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.deepOrangeAccent[400],
                  elevation: 5.0,
                  splashColor: Colors.white.withOpacity(0.4),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account? ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    TextButton(
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
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
