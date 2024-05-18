import 'package:diplome/models/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? _email;
  String? _password;
  String? _fullname;
  String? _workExperience;
  String? _degree;
  String? _diplome;

  void _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      model.User user = model.User(
        id: userCredential.user!.uid,
        fullname: _fullname,
        email: _email,
        password: _password,
        documents: '',
        workExperience: _workExperience,
        degree: _degree,
        diplome: _diplome,
      );

      await _firestore.collection('users').doc(user.id).set(user.toMap());
      routes.push("/");
    } catch (e) {
      print(e);
    }
  }

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
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _fullname = value,
                decoration: const InputDecoration(labelText: 'ФИО'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _email = value,
                decoration: const InputDecoration(labelText: 'Почта'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _password = value,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _workExperience = value,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Опыт работы'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _degree = value,
                decoration: const InputDecoration(labelText: 'Академ. Степень'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) => _diplome = value,
                decoration: const InputDecoration(labelText: 'Высшее образование'),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _register,
                    child: const Text('Регистрация'),
                  ),
                  const SizedBox(width: 8,),
                  ElevatedButton(
                    onPressed: ()=>context.replace("/login"),
                    child: const Text('Логин'),
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
