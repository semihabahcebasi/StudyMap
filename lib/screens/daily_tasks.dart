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
    setState(() {
      dailyTasks.add(TaskModel(name: taskName));
    });
    // listeye yeni eleman eklemek için list.add metodu kullanılır
  }

  // görev ekleme pencerresi
  //*************************** */
  void _showAddTaskDialog() {
    //once yazılan metni kontrol etmek için texteditingcontreller kullanılırz ve kontrol
    //edilen metni taskcontroller değişkenine atarız
    TextEditingController taskController = TextEditingController();

    //ekranın üzerine yeni bir pencere açar şaffaf.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // açılan penceredeki ekran gövdesidir hazır
          title: Text("yeni görev ekle"),
          content: TextField(
            controller:
                taskController, // textfield içindeki metne ulaşabilmek içindir
            decoration: InputDecoration(hintText: "görev adını yazınız"),
            autofocus: true,
          ),
          actions: [
            //iptal butonu
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("iptal"),
            ),

            //ekle butonu
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  //taskcontroller boş değilse yeni görev ekelmee fonksiyonu çağrılır
                  newTask(taskController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("ekle"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 226, 205, 1),

      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(233, 226, 205, 1),

        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => print("home sayfasına gider"),
            icon: Icon(Icons.home),
          ),
        ),

        title: Text(
          "Günlük görevler",
          style: TextStyle(
            fontFamily: 'Betania',
            fontSize: 35,
            color: Color.fromRGBO(94, 14, 14, 1),
            fontWeight: FontWeight(900),
          ),
        ),

        actions: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => print("profile sayfası"),
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: dailyTasks.length, // liste uzunluğu kadar eleman çizsin
        itemBuilder: (context, index) {
          return CheckboxListTile(
            //checkbox ı sola yatırır
            controlAffinity: ListTileControlAffinity.leading,
            //tıklandığındaki renk
            activeColor: const Color.fromARGB(255, 139, 10, 1),
            title: Text(
              dailyTasks[index].name,
              style: TextStyle(
                fontFamily: 'Betania',
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
          _showAddTaskDialog();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      // butonun ortalanmasını sağlar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 80, left: 40, right: 40),
        decoration: BoxDecoration(color: .fromRGBO(233, 226, 205, 1)),

        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 223, 158, 188),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 158, 188),
                ),
                onPressed: () => print("haftalık görevler sayfası"),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "haftalık görevler",
                        style: TextStyle(
                          fontFamily: "Betania",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.task, fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 80),
              //********************** */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 158, 188),
                ),
                onPressed: () => print("haftalık görevler sayfası"),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "study map",
                        style: TextStyle(
                          fontFamily: "Betania",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.map_outlined, fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
