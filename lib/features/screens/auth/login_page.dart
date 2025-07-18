import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsproject/cubit/Login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Color baseColor = const Color(0xFFE0E0E0);
  final Color orangeAccent = const Color(0xFFfbb34a); // Your specified color

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [baseColor, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 👇 Circular Image with Neumorphism
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: baseColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/ic_launcher_round.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(50, 0, 0, 0),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 👇 Login Container
                  Container(
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(48, 0, 0, 0),
                          offset: Offset(6, 6),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTextField(usernameController, 'Username'),
                        const SizedBox(height: 16),
                        _buildTextField(passwordController, 'Password', isPassword: true),
                        const SizedBox(height: 24),
                        BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const CircularProgressIndicator();
                              }

                              return Container(
                                decoration: BoxDecoration(
                                  color: orangeAccent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4, -4),
                                      blurRadius: 8,
                                    ),
                                    BoxShadow(
                                      color: Color.fromARGB(60, 0, 0, 0),
                                      offset: Offset(4, 4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    final username = usernameController.text.trim();
                                    final password = passwordController.text.trim();
                                    context.read<LoginCubit>().login(username, password);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: orangeAccent,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0, // Shadow already handled in the container
                                  ),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -3),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: baseColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
