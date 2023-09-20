import 'package:flutter/material.dart';

//-> introduction, string, function ,print
// String getFullName(String firstName, String lastName) {
//   // return firstName + ' ' + lastName;
//   // return 'firstName';
//   return '$firstName $lastName';
// }
// String getFullName(String firstName, String lastName) => '$firstName $lastName';
void main() {
  runApp(const MyApp());
}

// void test() {
//-> condition, data types
// final name = "Shadow";
// if (name == "Raihan") {
//   print("Welcome Raihan");
// } else if (name == "Shadow") {
//   print("Welcome Shadow");
// } else {
//   print("I do not know you");
// }
// var age = 20;
// final ageDiv = age / 2;
// final ageMul = age * 2;
// final agePlus = ++age;
// final ageMinux = --age;
// print(ageDiv);
// print(ageMul);
// print(agePlus);
// print(ageMinux);
// var s = "Hello ";
// var newS = s * 100; // it repeats
// print(newS);
// var names = ['Foo', 'Bar', 'Zoo'];
// print(names[0]);
// print(names.length);
// names.add('Hello');
// print(names);
// var data = {'foo', 'boo', 'zoo'};
// data.add('foo');
// data.add('boo');
// data.add('zoo');
// print(data.length);
// var person = {
//   'age': 20,
//   'name': 'shank',
// };
// print(person);
// person['alias'] = 'shadow';
// print(person);
//-> null safety,cherry-picking non-null value,Null-aware assignment operator
// int? val = null;// ->null safety
// val = 50;
// if(val==null){}
// List<String>? names = ["foo", "bar"];
// List<String>? naames = ["foo", "bar", null];//error-> null can not be assigned
// List<String?>? names = ["foo", "bar", null]; //work now
// names = null;
//it may work like this as well
// test(String? firstName,String? middleName,String? lastName)
// const String? firstName = null;
// const String? middleName = "Bar";
// const String? lastName = "Baz";
// const firstNonNullValue = firstName ?? middleName ?? lastName;//->herry-picking non-null value
// print(firstNonNullValue);
// test(String? firstName,String? middleName, String? lastName)
// String? name = firstName; /->Null-aware assignment operator
// name ??= middleName;
// name??=lastName;
// print(name);
//test(List<String>? names)
//final len=names?.length->conditional invocation
// names?.add("Baz");
// }

//->enumeration
// enum PersonProperties { firstName, lastName, age }
// void test() {
//   print(PersonProperties.firstName.name);
//   print(PersonProperties.firstName);
// }

//->switch
// enum AnimalType { cat, dog, bunny }
// void test(AnimalType animalType) {
//   switch (animalType) {
//     case AnimalType.bunny:
//       print("Bunny");
//       break;
//     case AnimalType.cat:
//       print("Cat");
//       break;
//     case AnimalType.dog:
//       print("Dog");
//       break;
//   }
// }

//-> class
// class Person {
//   final String name;
//   //constructors
//   Person(this.name);
//   void run() {
//     print("Running");
//   }

//   //method
//   void printName() {
//     print(name);
//   }

//   void breath() {
//     print("Breathing");
//   }
// }

// void test() {
//   //object or instance
//   final person = Person("Power");
//   person.run();
//   person.breath();
//   person.printName();
// }

//->Inheritance and Subclassing
// class LivingThing {
//   void breath() {
//     print("I am breathing");
//   }

//   void move() {
//     print("I am moving");
//   }
// }

// class Cat extends LivingThing {}

// void test() {
//   final cat = Cat();
//   cat.move();
//   cat.breath();
// }

//->abstract classes
// abstract class LivingThing {
//   void breath() {
//     print("I am breathing");
//   }

//   void move() {
//     print("I am moving");
//   }
// }

// class Cat extends LivingThing {}

// void test() {
//   // final thing = LivingThing();//cannot be instanitated
//   final cat = Cat();
//   cat.move();
//   cat.breath();
// }

// -> factory constructors
// class Cat {
//   final String name;
//   Cat(this.name);
//   // factory Cat.fluffBall() {
//   //   this.name = 'Fluff Ball';
//   // }
//   //usual way
//   // factory Cat.fluffBall() {
//   //   return Cat("Fluff Ball");
//   // }

// }
// void test() {
//   final fluffBall = Cat("fluff ball");
//   print(fluffBall.name);
// }

// -> custom operator
// class Cat extends Object {
//   final String name;
//   Cat(this.name);
//   @override
//   bool operator ==(covariant Cat other) => other.name == name;

//   @override
//   int get hashCode => name.hashCode;
// }

// void test() {
//   final cat1 = Cat("Foo");
//   final cat2 = Cat("Foo");
//   if (cat1 == cat2) {
//     print("Same");
//   } else {
//     print("not same");
//   }
// }

//->Advanced Dart
// class Cat {
//   final String name;
//   Cat(this.name);
// }

// class Person {
//   final String firstName;
//   final String lastName;
//   Person(this.firstName, this.lastName);
// }

// //extenions -> adding logic to existing classes
// extension Run on Cat {
//   void run() {
//     print("Cat $name is running");
//   }
// }

// extension FullName on Person {
//   String get fullName => "$firstName $lastName";
// }

// void test() {
//   final meow = Cat("fluffers");
//   meow.run();
//   final person = Person("MD. Raihan", "Alam");
//   print(person.fullName);
//   // print(meow.name);
// }

// //async
// Future<int> heavyFutureThatMultipliedByTwo(int a) {
//   return Future.delayed(const Duration(seconds: 3), () => a * 2);
// }

// void test() async {
//   final result = await heavyFutureThatMultipliedByTwo(10);
//   print(result);
// }

// //streams -> an async "pipe" of data
// Stream<String> getName() {
//   // return Stream.value("Foo");
//   return Stream.periodic(const Duration(seconds: 1), (value) {
//     return 'Value';
//   });
// }

// void test() async {
//   //await for to call for stream data
//   await for (final value in getName()) {
//     print(value);
//   }
//   print("Streamf inished working");
// }

// // generators -> return list of things but internally calculate data in simple way
// Iterable<int> genOneTwoThree() sync* {
//   yield 1;
//   yield 2;
//   yield 3;
// }
// //for async
// // Stream<Iterable<int>> genOneTwoThree() async* {
// //   yield [1];
// //   yield [2];
// //   yield [3];
// // }
// void test() {
//   print(genOneTwoThree());
//   for (final value in genOneTwoThree()) {
//     print(value);
//     if (value == 2) {
//       break;
//     }
//   }
// }

// //generic-> template like cpp
class Pair<A, B> {
  final A value1;
  final B value2;
  Pair(this.value1, this.value2);
}

void test() {
  final names = Pair("A", "B");
  print(names);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(getFullName('MD. Raihan', 'Alam'));
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
