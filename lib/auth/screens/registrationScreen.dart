import 'package:flutter/material.dart';
import 'package:realstateproject/auth/screens/login.dart';
import 'package:realstateproject/auth/services/auth_services.dart'; // ✅ Import your AuthService for registration

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ✅ Text controllers for each input field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ✅ Loading state to show a spinner when the API call is running
  bool isLoading = false;

  // ✅ Registration function (currently missing in your code)
  void registerUser() async {
    // 🟡 Step 1: Input validation (check if fields are empty)
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return; // stop execution if invalid
    }

    // 🟢 Step 2: Set loading state before making API call
    setState(() {
      isLoading = true;
    });

    // 🟢 Step 3: Call your API through AuthServices
    await AuthServices().register(
      context: context,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    // 🟢 Step 4: Disable loading after completion
    setState(() {
      isLoading = false;
    });
  }

  // ✅ Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"), // ✅ Added title for better UI
      ),
      body: SafeArea(
        // ✅ SafeArea prevents UI overlap
        child: SingleChildScrollView(
          // ✅ Makes it scrollable when keyboard is open
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ✅ Screen title
              const Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Full Name Field
              const Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Abdirahin Abdullahi",
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Email Field
              const Text(
                "Email Address",
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

              // ✅ Phone Field (missing in your original code UI)
              const Text(
                "Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "+252 61 2345678",
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "*******",
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Register button with loader
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registerUser, // Calls your function
                        child: const Text("Sign Up"), // fixed spelling
                      ),
                    ),

              const SizedBox(height: 16),

              // ✅ Already have an account section
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  child: const Text(
                    "Already have an account? Log in",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
