import 'package:chat_app/Constants.dart';
import 'package:chat_app/Pages/SignUp.dart';
import 'package:chat_app/Pages/chatPage.dart';
import 'package:chat_app/helper/showSnackBar.dart';
import 'package:chat_app/widgets/CustomButton.dart';
import 'package:chat_app/widgets/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String? email, password;

GlobalKey<FormState> FormKey = GlobalKey();

bool isLoading = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Form(
            key: FormKey,
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                  width: 250,
                ),
                Center(
                  child: Text(
                    "Chat App",
                    style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Pacifico"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 10),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: CustomFormTextField(
                  
                    onChanged: (data) {
                      email = data;
                    },
                    
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 15),
                  child: CustomFormTextField(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: "Password" , 
                    
                  ),
                ),
                CustomButton(
                  onTap: () async {
                    if (FormKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      try {
    await LoginUser();
    Navigator.pushNamed(context, Chatpage.id, arguments: email);  // Show success SnackBar if login succeeds
  } on FirebaseAuthException catch (e) {
    // Handle specific FirebaseAuthException errors
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password provided for that user.');
    } else {
      showSnackBar(context, 'Authentication error: ${e.code}');
    }
  } catch (e) {
    // Handle any other general errors
    print(e.toString());  // Log for debugging
    showSnackBar(context, "There was an error: ${e.toString()}");
  } 
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: "Sign In",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }),
                        );
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Color(0xffFFCB44),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
