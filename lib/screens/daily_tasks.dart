import 'package:flutter/material.dart';

class DailyTasks extends StatelessWidget {
  const DailyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 226, 205, 1),

      appBar: AppBar(
        toolbarHeight: 130,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(233, 226, 205, 1),
        title: Text(
          "Günlük görevler",
          style: TextStyle(
            fontFamily: 'Betania',
            fontSize: 40,
            color: Color.fromRGBO(94, 14, 14, 1),
            fontWeight: FontWeight(900),
          ),
        ),
      ),
    );
  }
}
