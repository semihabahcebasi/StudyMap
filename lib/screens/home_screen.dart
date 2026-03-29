import 'package:flutter/material.dart';
import 'package:study_map_app/screens/analiz.dart';
import 'package:study_map_app/screens/daily_tasks.dart';
import 'package:study_map_app/screens/friends.dart';
import 'package:study_map_app/screens/profile.dart';
import 'package:study_map_app/screens/study_map.dart';
import 'package:study_map_app/screens/weekly_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 226, 205, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 226, 205, 1),
        title: Row(
          children: [
            Text(
              'Home',

              style: TextStyle(
                fontFamily: 'Betania',
                color: const Color.fromARGB(255, 52, 116, 54),
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 10), // yazı ile ikon arasındaki boşluk
            Icon(
              Icons.home,
              color: const Color.fromARGB(255, 52, 116, 54),
              size: 30,
            ), // ev ikonu
            SizedBox(width: 195),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: Size(50, 50),
                backgroundColor: const Color.fromRGBO(233, 226, 205, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },

              child: Icon(
                Icons.person,
                color: Color.fromRGBO(94, 14, 14, 1),
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Hoşgeldiniz [kullanıcı adı] 😊",
              style: TextStyle(
                fontFamily: 'Rancho',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          Row(
            //günlük ve haftalık görev containerlerı
            children: [
              Padding(padding: EdgeInsetsGeometry.all(20)),
              Padding(
                padding: EdgeInsets.only(top: 50),

                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DailyTasks()),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  highlightColor: Color.fromARGB(221, 0, 0, 0),

                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(221, 184, 182, 18),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(Icons.task, size: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "günlük görevlerim",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.all(20)),

              Padding(
                padding: EdgeInsets.only(top: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeeklyTasks()),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  highlightColor: Color.fromARGB(221, 0, 0, 0),

                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(72, 165, 179, 0.867),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(Icons.account_tree_outlined, size: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "haftalık görevlerim",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            // study map containerı
            padding: const EdgeInsets.only(left: 135),
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudyMap()),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                highlightColor: Color.fromARGB(221, 0, 0, 0),

                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(179, 72, 127, 0.867),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Icon(Icons.map_outlined, size: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "study map'im",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            // analiz ve friends containerları
            children: [
              Padding(padding: EdgeInsetsGeometry.all(20)),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Analiz()),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  highlightColor: Color.fromARGB(221, 0, 0, 0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(199, 70, 70, 0.867),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(Icons.moving_sharp, size: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "analiz",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsetsGeometry.all(20)),

              Padding(
                padding: EdgeInsets.only(top: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Friends()),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  highlightColor: Color.fromARGB(221, 0, 0, 0),

                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(101, 189, 85, 0.867),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(Icons.person_add_alt, size: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "friends",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
