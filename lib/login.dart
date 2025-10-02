import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/header.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000B1D),
              Color(0xFF001A3A),
              Color(0xFF002D5A),
              Color(0xFF001122),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        // Logo
                        SvgPicture.asset(
                          'assets/login_icon.svg',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 30),
                        // Title
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to continue your journey',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan.shade300,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Login Form
                        _buildInputField(
                          'Email',
                          'assets/email_icon.svg',
                          false,
                        ),
                        const SizedBox(height: 20),
                        _buildInputField(
                          'Password',
                          'assets/password_icon.svg',
                          true,
                        ),
                        const SizedBox(height: 30),
                        // Login Button
                        _buildLoginButton(context),
                        const SizedBox(height: 20),
                        // Forgot Password
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.cyan.shade300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Social Login
                        Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton('assets/google_icon.svg'),
                            const SizedBox(width: 20),
                            _buildSocialButton('assets/facebook_icon.svg'),
                            const SizedBox(width: 20),
                            _buildSocialButton('assets/apple_icon.svg'),
                          ],
                        ),
                        const SizedBox(height: 40),
                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.cyan.shade300,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, String iconPath, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan.shade600, Colors.blue.shade600],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
