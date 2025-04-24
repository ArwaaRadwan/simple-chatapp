//import 'package:chat_app/Pages/login_page.dart';
//import 'package:chat_app/Constants.dart';
import 'package:chat_app/Constants.dart';
import 'package:chat_app/Pages/chatPage.dart';
import 'package:chat_app/helper/showSnackBar.dart';
//import 'package:chat_app/main.dart';
import 'package:chat_app/widgets/CustomButton.dart';
import 'package:chat_app/widgets/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;

  String? password;

  GlobalKey<FormState> FormKey = GlobalKey();

  bool isLoading = false;

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
                      "Sign Up",
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
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: "Password",
                  ),
                ),
                CustomButton(
                  onTap: () async {
                    if (FormKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      try {
                        await SignUpUser();
                        Navigator.pushNamed(context, Chatpage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The email address is already in use by another account');
                        } else if (e.code == 'weak-password') {
                          showSnackBar(context, 'Weak Password.');
                        }
                      } catch (e) {
                        showSnackBar(context, "there was an error");
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: "Sign Up",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        //Navigator.pushNamed(context, "LoginPage");
                        //  Navigator.push(context,
                        //      MaterialPageRoute(builder: (context) {
                        //    return LoginPage();
                        //  }
                        //  )
                        //  );
                      },
                      child: Text(
                        " Sign In",
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

  Future<UserCredential> SignUpUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
