import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_page.dart';
import 'loginPage.dart'; // Import LoginPage
import 'signUpPage.dart'; // Import SignUpPage
import 'home_page.dart';
import 'profile_page.dart';
import 'date_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Add const and Key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue.shade700,
        fontFamily: 'Roboto',
        textTheme: const TextTheme( // Use const here
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      initialRoute: '/login', // Initial route is set to login
      routes: {
        '/login': (context) =>  LoginPage(), // Add const here
        '/signup': (context) =>  SignUpPage(), // Add const here
        '/HomePage': (context) => HomePage(userName: ''), // HomePage may have dynamic data
        '/ProfilePage': (context) =>  ProfilePage(), // Add const here
        '/DatePage': (context) =>  DatePage(), // Add const here
        '/ChatPage': (context) =>  ChatPage(), // Add const here
      },
    );
  }
}
