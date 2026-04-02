import 'package:flutter/material.dart';
import 'package:study_map_app/models/task_model.dart';
import 'package:study_map_app/screens/home_screen.dart';
import 'package:study_map_app/screens/profile.dart';
import 'package:study_map_app/screens/study_map.dart';
import 'package:study_map_app/screens/weekly_tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // JSON işlemleri için gerekli

class DailyTasks extends StatefulWidget {
  const DailyTasks({super.key});

  @override
  State<DailyTasks> createState() => _DailyTasksState();
}

class _DailyTasksState extends State<DailyTasks> {
  // check box için göreverin tutalacağı liste tanımlandı
  List<TaskModel> dailyTasks = [];
  @override
  void initState() {
    super.initState();
    _loadFromDisk(); // Sayfa ilk açıldığında verileri diskten oku
  }

  // yeni görev ekleme fonksiyonu
  void newTask(String taskName) {
    setState(() {
      dailyTasks.add(TaskModel(name: taskName));
    });
    _saveToDisk(); // Görev eklendikten sonra verileri diske kaydet
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

  // Yardımcı bir fonksiyon yazarsak kod çok daha temiz görünür
  Widget _buildNavButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140, // Buton genişliği
        height: 80, // Buton yüksekliği
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 107, 14, 14), // Senin pembe rengin
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // Metni beyaz yaparsan pembe üzerinde daha iyi okunur
              ),
            ),
            SizedBox(height: 5),
            Icon(icon, color: Colors.white, size: 28),
          ],
        ),
      ),
    );
  }

  // Verileri hem isim hem durum olarak kaydetme
  Future<void> _saveToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    // Tüm listeyi JSON metnine çeviriyoruz
    List<String> taskJsonList = dailyTasks
        .map((task) => jsonEncode(task.toMap()))
        .toList();
    await prefs.setStringList('saved_daily_tasks', taskJsonList);
  }

  // Verileri hem isim hem durum olarak geri yükleme
  Future<void> _loadFromDisk() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedJsonList = prefs.getStringList('saved_daily_tasks');

    if (savedJsonList != null) {
      setState(() {
        dailyTasks = savedJsonList
            .map((item) => TaskModel.fromMap(jsonDecode(item)))
            .toList();
      });
    }
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
            onPressed: () {
              Navigator.pop(context);
            },
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
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

            onChanged: (value) {
              // İŞTE BURAYA KOYUYORUZ:
              setState(() {
                dailyTasks[index].isDone = value!; // Ekranda durumu güncelle
              });
              _saveToDisk(); // Hafızaya kaydet ki sayfayı yenileyince gitmesin!
            },
          );
        },
      ),

      floatingActionButton: SizedBox(
        width: 45,
        height: 45,
        child: FloatingActionButton(
          //butonun boyutu
          backgroundColor: Colors.black26,
          onPressed: () {
            //tıklandığında görev ekleme penceresi açılır
            _showAddTaskDialog();
          },
          child: Icon(Icons.add, color: Colors.white, size: 20),
        ),
      ),
      // butonun ortalanmasını sağlar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: Padding(
        // Alt kısma biraz boşluk bırakıyoruz
        padding: const EdgeInsets.only(
          bottom: 50,
          left: 20,
          right: 20,
          top: 15,
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Butonları eşit dağıtır
          children: [
            // 1. BUTON: Haftalık Görevler
            _buildNavButton(
              context,
              title: "haftalık görevler",
              icon: Icons.task,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeeklyTasks()),
              ),
            ),

            // 2. BUTON: Study Map
            _buildNavButton(
              context,
              title: "study map",

              icon: Icons.map_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudyMap()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
