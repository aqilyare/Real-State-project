import 'package:flutter/material.dart';
import 'package:realstateproject/auth/services/auth_services.dart';
import 'package:realstateproject/auth/screens/registrationScreen.dart';
// Removed unused imports (HomeScreen, MainScreen) for now — add them back when you use navigation

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ✅ Text controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ✅ A boolean flag to show loading indicator while logging in
  bool isLoading = false;

  // ✅ Function to handle login button press
  void login() async {
    // 🟡 Basic input validation before sending API call
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return; // stop execution if fields are empty
    }

    // 🟢 Show loading spinner while login request is in progress
    setState(() {
      isLoading = true;
    });

    // Call the AuthService login method
    await AuthServices().login(
      context: context,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // 🟢 Hide loading spinner after response
    setState(() {
      isLoading = false;
    });
  }

  // ✅ Dispose controllers to avoid memory leaks
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Optional SafeArea to prevent content from overlapping system UI
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          // ✅ Scroll view to prevent overflow when keyboard opens
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50), // space at top for cleaner UI
                // ✅ Title
                const Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 40),

                // ✅ Email Field
                const Text(
                  "Email Address",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Password Field
                const Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true, // hides the password
                  decoration: InputDecoration(
                    hintText: "*******",
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Login button with loading indicator
                isLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(), // shows spinner when loading
                      )
                    : SizedBox(
                        width: double.infinity, // full-width button
                        child: ElevatedButton(
                          onPressed: login, // calls login() function
                          child: const Text("Sign In"), // fixed spelling
                        ),
                      ),

                const SizedBox(height: 16),

                // ✅ Registration link
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    ),
                    child: const Text(
                      "Don't have an account? Sign Up", // fixed spelling
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // extra spacing at bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
