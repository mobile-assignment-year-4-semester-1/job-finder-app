import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:job_finder_app/features/screens/pages/default_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

import '../../utils/constants/icons.dart';
import '../../utils/themes/light_mode.dart';
import '../routes/app_route.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

bool showBack = false;

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBack)
              Container(
                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Image.asset(CallIcons.iconBack, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jöbseek',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome Back 👋',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Let's Login. Apply to jobs!",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    SizedBox(height: 60),
                    _emailField,
                    SizedBox(height: 25),
                    _passwordField,
                    SizedBox(height: 40),
                    _loginButton,
                    SizedBox(height: 35),
                    _forgotPassword,
                    SizedBox(height: 35),
                    _orContinueWith,
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon(CallIcons.apple),
                        SizedBox(width: 24),
                        _socialIcon(CallIcons.google),
                        SizedBox(width: 24),
                        _socialIcon(CallIcons.facebook),
                      ],
                    ),
                    SizedBox(height: 80),
                    _loginPrompt(context),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _emailField {
    final theme = Theme.of(context);
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 16),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: "Email Address",
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            CallIcons.iconEmail,
            width: 20,
            height: 20,
            color: Colors.grey,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your email";
        }
        // Basic email validation
        final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
        if (!emailRegex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }

  Widget get _passwordField {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      style: TextStyle(fontSize: 16),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            CallIcons.iconPassword,
            width: 20,
            height: 20,
            color: Colors.grey,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your password";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }

  Widget get _loginButton {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CallColors.buttonGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final email = _emailController.text.trim();
            final password = _passwordController.text.trim();
            _signIn(email, password);
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget get _forgotPassword {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget get _orContinueWith {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }

  Widget _loginPrompt(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Don\'t have an account? ',
            style: TextStyle(color: Colors.grey[700], fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.signupScreen);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[200],
      child: Image.asset(assetPath, width: 35, height: 35, fit: BoxFit.contain),
    );
  }

  Future<void> _signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("UserCredential: $userCredential");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login Successully!",
            style: TextStyle(color: AppColors.textWhite, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.success,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
          ),
        ),
      );

      await Future.delayed(Duration(milliseconds: 800));
      Get.off(DefaultScreen());
    } on FirebaseAuthException catch (e) {
      print('🔥 Caught FirebaseAuthException: ${e.code}');
      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'No account found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'The password is incorrect. Please try again.';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: $errorMessage",
            style: TextStyle(color: AppColors.textWhite, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
          ),
        ),
      );
    } catch (e) {
      print('❌ Caught unexpected error: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An unexpected error occurred.",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
