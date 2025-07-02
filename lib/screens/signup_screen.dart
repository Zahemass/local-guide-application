import 'package:flutter/material.dart';
import 'package:crowd_local_lens/widgets/liquid_glass_container.dart';
import 'package:crowd_local_lens/constants/colors.dart';
import 'login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey _backgroundKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: RepaintBoundary(
        key: _backgroundKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  LiquidGlassContainer(
                    width: size.width * 0.9,
                    height: size.width * 0.93,
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    borderRadius: 25,
                    backgroundKey: _backgroundKey,
                    child: SingleChildScrollView(
                      child: _buildFormContent(),
                    )
                  ),
                  const SizedBox(height: 30),
                  _buildDividerWithText(),
                  const SizedBox(height: 20),
                  _buildSocialButtons(),
                  const SizedBox(height: 20),
                  _buildLoginText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 10),
        Text(
          'SIGN UP',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInputField('Username', _usernameController),
              const SizedBox(height: 10),
              _buildInputField('Password', _passwordController, isPassword: true),
              const SizedBox(height: 10),
              _buildInputField('Confirm Password', _confirmPasswordController, isPassword: true),
            ],
          ),
        ),
        const SizedBox(height: 15),
        _buildSignupButton(),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Center(
      child: Container(
        width: 350,
        margin: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.montserrat(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF0048), Color(0xFFDD2851)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Handle signup
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          'SIGN UP',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
  Widget _buildDividerWithText() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white70)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or continue with',
            style: GoogleFonts.montserrat( // Using Montserrat font
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.white70)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('assets/images/google.png'),
        const SizedBox(width: 25),
        _buildSocialButton('assets/images/apple.png'),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: 'Already have an account ? ',
            style: GoogleFonts.montserrat(
              color: Colors.black,
            ),
            children: [
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.montserrat(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}