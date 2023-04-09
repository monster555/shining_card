import 'package:flutter/material.dart';
import 'package:rotating_shining_card/rotating_shining_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rotating Shining Card Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RotatingShiningCard(
          width: 400,
          height: 560,
          imageUrl:
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bd1b5c26-61a8-442b-b29e-423a03e68757/dcdczdx-61cc083d-0359-4b1f-b4d6-0fdb8add8cb9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JkMWI1YzI2LTYxYTgtNDQyYi1iMjllLTQyM2EwM2U2ODc1N1wvZGNkY3pkeC02MWNjMDgzZC0wMzU5LTRiMWYtYjRkNi0wZmRiOGFkZDhjYjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Y839f_KPx-Hdax3ioRSl78xgAkhKb0GrbV8_tO2z1v8',
        ),
      ),
    );
  }
}
