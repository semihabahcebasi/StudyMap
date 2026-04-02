class TaskModel {
  String name;
  bool isDone;

  TaskModel({required this.name, this.isDone = false});

  // Modeli Map'e (sözlüğe) çevirir
  Map<String, dynamic> toMap() => {'name': name, 'isDone': isDone};

  // Map'ten model oluşturur
  factory TaskModel.fromMap(Map<String, dynamic> map) =>
      TaskModel(name: map['name'], isDone: map['isDone']);
}
//Bu işlem, modeli metne dönüştürmeye yarar):