// //practical 3

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Practical3",
//     home: HomePage(),
//   ));
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //scaffold:kind of container or kind of widget that can handle container.
//     return Scaffold(
//       // appbar used for give or define header
//       //header body footer section of app
//       appBar: AppBar(title: Text("My APP")),
//       //body uswd to create main functionality of app
//       //Center method used to print text in center
//       body: Container(
//         child: Center(child: Text("This is the Body")),
//       ),
//       // appBar: AppBar(title:"MYAPP"),
//     );
//   }
// }

//practical 3

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Practical3",
//     home: HomePage(),
//   ));
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //scaffold:kind of container or kind of widget that can handle container.
//     return Scaffold(
//       // appbar used for give or define header
//       //header body footer section of app
//       appBar: AppBar(title: Text("My APP")),
//       //body uswd to create main functionality of app
//       //Center method used to print text in center
//       body: Container(
//         child: Center(
//           child: Container(
//             width: 100,
//             height: 100,
//             // color: Colors.amber,
//             child: Text("Hi Container i am here"),
//             padding: EdgeInsets.all(20),
//             //to make text in center use alignment property
//             alignment: Alignment.center,
//             //if using decoration method cant use color method
//             decoration: BoxDecoration(
//               // color: Colors.amberAccent,

//               //in bracket give radius and when using shape:BoxShape.circle dont use borderRadius property.
//               // borderRadius: BorderRadius.circular(25),
//               // gradient: LinearGradient(
//               //     colors: [Colors.red, Colors.yellow, Colors.pink]),
//               // shape: BoxShape.circle,

//               //for boxshadow comment shape,gredient and borderradius
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blueAccent,
//                   blurRadius: 15,
//                   offset: Offset(10.0, 2.0),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////Practical 3//////////////////////////

// Text Widget

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("Text Widget by: Anjali"),
//       ),
//       body: Text(
//         "This is the  body section example of text widget",
//         style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.cyan,
//             overflow: TextOverflow.ellipsis),
//       ),
//     ),
//   ));
// }
//////////////////////////////////////////////

//Icons Widget
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//       home: Scaffold(
//     appBar: AppBar(
//       title: Text("Icon Widget Example by: Anjali"),
//     ),
//     body: Icon(
//       Icons.diamond,
//       size: 50.0,
//       color: Colors.blue,
//     ),
//   )));
// }

//////////////////////////////////////////////
//Row widget

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Row Widget Example--By Anjali",
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.black87,
//         ),
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           textDirection: TextDirection.ltr,
//           children: [
//             Text("Lion"),
//             Text("Fox"),
//             Text("Tiger"),
//           ],
//         )),
//   ));
// }

//////////////////////////////////////////////
//Container widget

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Practical3",
//     home: HomePage(),
//   ));
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My APP"),
//         backgroundColor: Colors.brown[200],
//       ),
//       body: Container(
//         child: Center(
//           child: Container(
//             width: 100,
//             height: 100,
//             // color: Colors.amber,
//             child: Text("Hello from Container"),
//             padding: EdgeInsets.all(10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.amberAccent,

//               // borderRadius: BorderRadius.circular(25),
//               gradient: LinearGradient(
//                   colors: [Colors.orange, Colors.yellow, Colors.lime]),
//               shape: BoxShape.circle,

//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blueAccent,
//                   blurRadius: 15,
//                   offset: Offset(10.0, 2.0),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////
// Rich Text
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text("RichText Example")),
//         body: Center(
//           child: RichText(
//             text: const TextSpan(
//               style: TextStyle(fontSize: 20, color: Colors.black),
//               children: [
//                 TextSpan(text: 'This is '),
//                 TextSpan(
//                   text: 'RichText ',
//                   style:
//                       TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
//                 ),
//                 TextSpan(text: 'Example.'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////
// TextField
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("TextField Widgets")),
        body: const Center(
          child: SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your text here',
                hintText: 'Name (i.e.: Anjali)',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
