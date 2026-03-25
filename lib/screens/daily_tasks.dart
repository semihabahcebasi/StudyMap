import 'package:flutter/material.dart';
import 'package:study_map_app/models/task_model.dart';

class DailyTasks extends StatefulWidget {
  const DailyTasks({super.key});

  @override
  State<DailyTasks> createState() => _DailyTasksState();
}

class _DailyTasksState extends State<DailyTasks> {
  // check box için göreverin tutalacağı liste tanımlandı
  List<TaskModel> dailyTasks = [];

  // yeni görev ekleme fonksiyonu
  void newTask(String taskName) {
    setState(() {});
    // listeye yeni eleman eklemek için list.add metodu kullanılır
    dailyTasks.add(TaskModel(name: taskName));
  }

  // görev ekleme pencerresi
  //*************************** */

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

      body: ListView.builder(
        itemCount: dailyTasks.length, // liste uzunluğu kadar eleman çizsin
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
              dailyTasks[index].name,
              style: TextStyle(
                // tamamlanan görevlerin üzerini çizmek için decoration
                decoration: dailyTasks[index].isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),

            //buradaki value checkboxlisttitle ın parametresidir
            value: dailyTasks[index].isDone,

            // buradaki value ise fonksiyon değişkenidir
            onChanged: (bool? value) {
              setState(() {
                dailyTasks[index].isDone = value!;
              });
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        onPressed: () {
          //tıklandığında görev ekleme penceresi açılır
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
