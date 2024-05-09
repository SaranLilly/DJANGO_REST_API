import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/cars/'));

      if (response.statusCode == 200) {
        setState(() {
          message = 'hello lilly';
        });
      } else {
        setState(() {
          message = 'Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Response Message'),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
// import 'setting_page.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadIsHomePageVisible();
//   }

//   Future<void> _loadIsHomePageVisible() async {
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Durian Sound Classify',
//       theme: ThemeData(
//         inputDecorationTheme: const InputDecorationTheme(
//           fillColor: Colors.white,
//           filled: true,
//         ),
//       ),
//       home: _isLoading
//           ? const SplashScreen()
//           : const LoginPage(isHomePageVisible: true),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
