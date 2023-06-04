import 'package:flutter/material.dart';
import 'package:trademade/View/homepage.dart';
class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/getstarted.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 32),
            const Text(
              'GREAT WAY TO LIFT UP YOUR STYLE',
              style: TextStyle(
                fontFamily: 'Helvetica Rounded',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Complete your style with awesome shoes and sneakers from us',
              style: TextStyle(
                fontFamily: 'Helvetica Rounded',
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Get started'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
// class GetStartedPage extends StatelessWidget {
//   final Key? key;

//   GetStartedPage({this.key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'images/getstarted.png'), // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 32),
//             const Text(
//               'GREAT WAY TO LIFT UP YOUR STYLE',
//               style: TextStyle(
//                 fontFamily: 'Helvetica Rounded',
//                 fontSize: 25,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.5,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Complete your style with awesome shoes and sneakers from us',
//               style: TextStyle(
//                 fontFamily: 'Helvetica Rounded',
//                 fontSize: 20,
//                 color: Colors.white,
//                 letterSpacing: 1.0,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: 200,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   onPrimary: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: const Text('Get started'),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
