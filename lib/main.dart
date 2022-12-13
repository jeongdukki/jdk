import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/signup.dart';
import 'package:project/weather/view.dart';
// import 'package:flutter_def/ListViewTest.dart'; // 상세뷰 없이 볼때 사용
// material design(안드로이드풍으로 설계된 디자인)
// flutter는 DART기반의 window 프로그래밍

void main() {
  // final person = Person('홍길동', 20);
  // runApp(SecondPage(person: person,)); // MyApp을 인스턴스해서 전달
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // 인터페이스는 StatelessWidget, SteatefulWidget 둘 중에 하나로 생성
  const MyApp({super.key}); // 생성자 호출 : StatelessWidget의 키를 전달

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // 화면에 출력 : BuildContext 시스템에서 전달되는 객체
    return MaterialApp( // 디자인을 선택한 것을 리턴
      routes: {
      //  '/detailview': (context) => ListDetailView(), // Navigator.pushNamed(context, '/detailview')
      //  '/loginview': (context) => LoginView(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { // State를 가지고 있음 : 변수
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override // 재정의해 놓으면 lifecycle에 의해서 자동으로 호출
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { // State클래스를 상속받음
  int _counter = 0; // 상태 변수

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold( // 화면에서 가벽(Widget을 품고 있는 하나의 바운더리)
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title), // 부모를 widget으로 지정
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center( // 위치를 나타내는 widget
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column( // 열로 데이터를 배치하는 위젯
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center, // 정렬에 대한 키
          children: <Widget>[ // 위젯 리스트에 있는 객체는 다 위젯
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('다음페이지'),
              onPressed: () async{ // 비동기 통신
                final person = Person('홍길동', 40);
                final result = await Navigator.push( // Stack 복귀 주소를 저장 라우트에 지정된 주소로 이전
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(person: person),
                  )
                );
                debugPrint('data: $result');
              },
            ),
            ElevatedButton(
              child: const Text('텍스트입력'),
              onPressed: () async{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCustomForm()
                  )
                );
              }
            ),
            ElevatedButton(
              child: const Text('성적출력'),
              onPressed: (){
                final student = Student('노력파', 100, 100, 100);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentPage(student : student)
                  )
                );
              },
            ),
            ElevatedButton(
              child: const Text('로그인'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage()
                  )
                );
              },
            ),
            ElevatedButton(
              child: const Text('회원가입'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage()
                  )
                );
              },
            ),
            ElevatedButton(
              child: const Text('날씨'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationScreen()
                  )
                );
              },
            ),                                               
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( // body하고 동격
        onPressed: _incrementCounter, // 이벤트
        tooltip: 'Increment',
        child: const Icon(Icons.add_alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        color: Colors.orangeAccent,
        child: SizedBox(
          height: 100.0,
          child: Row(
            children: <Widget>[
              const Text('융합학원  '),
              const Text('대전시청'),
              const Icon(Icons.home),
              IconButton(
                icon: const Icon(Icons.add_box),
                onPressed:(){
                  debugPrint('테스트입니다');
                },
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: const <Widget>[
        IconButton(
          icon:Icon(Icons.account_box),
          onPressed: null,
        ),
        IconButton(
          icon:Icon(Icons.account_circle), // Icons는 Enum변수 Icon widget이고
          onPressed: null,
        ),
      ],
    );
  }
}

class Person{
  String name;
  int age;

  Person(this.name, this.age);
}
// dynamic, var, final, const를 반드시 사용하자 -> null safety에 도움이 된다
class SecondPage extends StatelessWidget{ // 다시 그리는 것이 없음(SetState가 없음)
  final Person person;
  SecondPage({Key? key, required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context){
    debugPrint('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: ElevatedButton(
        child: const Text('이전 페이지로'),
        onPressed: (){
          Navigator.pop(context, 'ok');
        },
      ),
    );
  }
}

class TextFieldTest extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Retrive Text Input',
      home: MyCustomForm(),
    );
  }
}
class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState(){
    return _MyCustomFormState();
  }
}
class _MyCustomFormState extends State<MyCustomForm>{
  final myController = TextEditingController();
  @override
  void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
  }
  @override
  void dispose(){
    myController.dispose(); // 반드시 해제 시켜야 함
    super.dispose();
  }
  void _printLatestValue(){
    debugPrint('Second text field: ${myController.text}');
  }
  @override
  Widget build(BuildContext context){
    return Scaffold( // 가벽을 세우고
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding( // 띄워쓰기
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField( // 텍스트 입력 위젯
              style: const TextStyle(fontSize: 18),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                hintText: '메일주소를 입력하시오'),
              onChanged: (text){
                debugPrint('First text field: $text');
              },
            ),
            TextField(
              onChanged: (text){ // 이벤트 // 변화가 일어나면 _printLatestValue
                debugPrint('First text field: $text');
              },
            ),
            TextField(
              controller: myController, // 컨트롤러
            )
          ],
        )
      ),
    );
  }
}

// 문제 : 새로운 페이지를 만들고 메인에서 넘어오는 1인분의 이름 국어 영어 수학 점수를 받아서
// 합계를 계산하고 이름과 합계를 출력하는 새로운 페이지를 만들고 다시 메인으로 복귀하도록 프로그램을 작성하시오
class Student{
  String name;
  var kor;
  var eng;
  var mat;
  Student(this.name, this.kor, this.eng, this.mat);
}

class StudentPage extends StatelessWidget{ // 경고창을 제외하고 별도로 창을 구성
  final Student student;
  const StudentPage({Key? key, required this.student}) : super(key : key); // 상세뷰
  @override
  Widget build(BuildContext context){ // 화면 출력용
    return Scaffold( // 가벽(4가지 영역)
      appBar: AppBar(
        title: const Text('성적확인'),
      ),
      body: Center( // 위치 제어도 위젯
        child: Column( // 어떻게 배치할 것인지도 위젯으로
          mainAxisAlignment: MainAxisAlignment.center, // enum변수 : 범주형 변수
          children: <Widget>[
            Text('이름: ${student.name}'), // 클래스 속성을 외부에서 참조할 때 $붙이면 안됨
            Text('국어: ${student.kor}'),
            Text('영어: ${student.eng}'),
            Text('수학: ${student.mat}'),
            ElevatedButton(
              child: const Text('이전 페이지로'),
              onPressed: (){
                Navigator.pop(context, 'ok');
              },
            )
          ]
        ),
      ),
    );
  }
}