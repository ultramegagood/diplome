import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diplome/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  String? _email;
  String? _password;

  void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      routes.push("/");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _email = value,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _password = value,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Логин'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () => context.replace("/auth"),
                    child: const Text('Регистрация'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
