import 'package:flutter/material.dart';
import 'loginPage.dart'; // Import LoginPage
import 'signUpPage.dart'; // Import SignUpPage
import 'home_page.dart';
import 'profile_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue.shade700,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
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
        '/login': (context) => LoginPage(), // Route for login
        '/signup': (context) => SignUpPage(), // Route for registration
        '/HomePage': (context) => HomePage(userName: '',),
        '/ProfilePage': (context) => ProfilePage(), // Route for profile page with an empty username placeholder
      },
    );
  }
}
