import 'package:desmov_t1_kdrz/Student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String name = "Zúñiga";
int age = 21;
bool buenoParaProgramar = true;

class _MyHomePageState extends State<MyHomePage> {
  final List<Student> students = [
    Student('Alice', 'ALI001'),
    Student('Bob', 'BOB002'),
    Student('Charlie', 'CHA003')
  ];
  final Student student = Student("Kevin", "KDRZ123");

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtStudentId = TextEditingController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _noincrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  Widget _getAllStudent(){
    return Column(
      children: [
        const SizedBox(height: 12,),
        Text("Student's list:"),
        SizedBox(height: 12,),
        ...students.map((student) => Text("- ${student.name}, ID: ${student.studentId}")),

      ],
    );
  }

  void _addStudent(){
    final name = _txtName.text.trim();
    final studentId = _txtStudentId.text.trim();
    
    if(name.isNotEmpty && studentId.isNotEmpty){
      setState(() {
        students.add(Student(name, studentId));
        _txtName.clear();
        _txtStudentId.clear();
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Estudiante $name agregado")),
      );
      return;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Por favor completa todos los campos")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Nombre: $name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Edad: $age',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Bueno para programar: ${buenoParaProgramar ? "Sí" : "No"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _txtName,
              decoration: InputDecoration(
                labelText: "Escribe tu nombre",
                border: OutlineInputBorder(),
              ),
            ),
            ),
            SizedBox(height: 10),
            Padding(padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _txtStudentId,
              decoration: InputDecoration(
                labelText: "Escribe tu ID de estudiante",
                border: OutlineInputBorder(),
              ),
            ),
            ),
            SizedBox(height: 10),
            Padding(padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: _addStudent,
                child: Text("Guardar"),
              ),
            ),
            SizedBox(height: 20,
            ),
            Text(
              'Estudiantes:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '- ${student.name}, ID: ${student.studentId}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            _getAllStudent(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _noincrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}