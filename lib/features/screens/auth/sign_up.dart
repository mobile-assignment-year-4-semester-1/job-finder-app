
import 'package:flutter/material.dart';
import '../../utils/constants/icons.dart';
import '../../utils/themes/light_mode.dart';
import '../routes/app_route.dart';

class SignUp extends StatefulWidget {
  const SignUp({ super.key });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Image.asset(CallIcons.iconBack, color: Colors.black),
                onPressed: () {

                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
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
                  SizedBox(height: 5),
                  Text(
                    'Registration 👍',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Let's Register. Apply to jobs!",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 35),

                  _fullNameField,
                  SizedBox(height: 16),
                  _emailField,
                  SizedBox(height: 16),
                  _passwordField,
                  SizedBox(height: 16),
                  _confirmPasswordField,
                  SizedBox(height: 30),
                  _RegisterButton,
                  SizedBox(height: 35),
                  _OrContinueWith,
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
                  _LoginPrompt,
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget get _fullNameField {
    return TextFormField(
      controller: _fullNameController,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: "Full Name",
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            CallIcons.iconUsername,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your full name";
        }
        return null;
      },
    );
  }

  Widget get _emailField {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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

  Widget get _confirmPasswordField {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: "Confirm Password",
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
            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        }
        if (value != _passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }

  Widget get _RegisterButton {
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
          // Handle registration
        },
        child: const Text(
          "Register",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget get _OrContinueWith{
     return Row(
       children: [
         Expanded(
           child: Divider(
             color: Colors.grey,
             thickness: 1,
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: Text(
             'Or continue with',
             style: TextStyle(
               color: Colors.grey,
               fontSize: 14,
             ),
           ),
         ),
         Expanded(
           child: Divider(
             color: Colors.grey,
             thickness: 1,
           ),
         ),
       ],
     );
  }

  Widget get _LoginPrompt{
    return  Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoute.signinScreen);
        },
        child: RichText(
          text: TextSpan(
            text: 'Have an account? ',
            style: TextStyle(color: Colors.grey[700],fontSize: 15,),
            children: [
              TextSpan(
                text: 'Log in',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _socialIcon(String assetPath) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[200],
      child: Image.asset(
        assetPath,
        width: 35,
        height: 35,
        fit: BoxFit.contain,
      ),
    );
  }
}