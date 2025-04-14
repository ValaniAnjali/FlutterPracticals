// // Column Widget
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Column Widget Example',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.blue, // Added background color for AppBar
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Text(
//               'Anjali',
//               style: TextStyle(color: Colors.orange, fontSize: 30),
//             ),
//             Text(
//               'Aradhana',
//             ),
//             Text(
//               'Sneha',
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Image Widget
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text('Image Widget Example'),
//             ),
//             body: Container(
//               width: 100,
//               height: 100,
//               child: Image.asset('assets/images/bird.png'),
//             ))),
//   );
// }

// Rich Text Widget
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('RichText Widget Example'),
            ),
            body: RichText(
                text: const TextSpan(
                    text: 'Rich Text',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    children: [
                  TextSpan(
                      text:
                          'my name is anjali welcome to this beautiful flutter\'s world hope you alll are fine learn every widget properly dont forget i am rich: thats why i am rich widget.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ))
                ])))),
  );
}
