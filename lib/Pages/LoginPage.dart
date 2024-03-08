import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_mae_3rd_wh/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {

  //Login Function
  static Future<User?> loginUsingEmailPassword(
      { required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
        // FirebaseAuth.instance.currentUser?.email;

    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print("Wrong password provided for that user");
      }
    }
    return user;
  }

  var _tpnumController = TextEditingController();
  var _passwordController = TextEditingController();
  var _errorText = ''; // Variable to hold error message

  //Sign In function
  Future signIn() async {
    User? user = await loginUsingEmailPassword(
        email: _tpnumController.text,
        password: _passwordController.text,
        // email: "tp000000@mail.apu.edu.my",  // HARD CODE FOR TEST LAB PURPOSE
        // password: "1234567",
        context: context);

    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      setState(() {
        // Set error message if authentication failed
        _errorText = 'Incorrect username or password';
      });
    }
  }

  @override
  void dispose() {
    _tpnumController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Color background = const Color(0xFFF3EEEA);
  Color loginBackground = const Color(0xFFFECF6A);
  Color border = const Color(0xFFEBE3D5);
  Color textFieldBackground = const Color(0xFFB0A695);
  Color textFieldBorder = const Color(0xFF776B5D);
  Color buttonBackground = const Color(0xFF776B5D);
  Color textPrimary = const Color(0xFF776B5D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFECF6A),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                   child: Image.network('https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/Logo.png?alt=media&token=283705e5-1641-4864-beba-85f92db7d49c')),

                // Username textbox
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _tpnumController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF776B5D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF776B5D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'TP Email',
                      fillColor: const Color(0xFFB0A695),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF776B5D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF776B5D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: const Color(0xFFB0A695),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Show error message
                Text(
                  _errorText,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),

                // Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF776B5D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}