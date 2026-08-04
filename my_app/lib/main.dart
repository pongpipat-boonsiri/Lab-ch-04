import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'บทที่ 4',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 241, 163, 241),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // รูปจากอินเทอร์เน็ต
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Mah%C5%8D_Sh%C5%8Djo_Madoka_Magika_%28Logo%29.svg/3840px-Mah%C5%8D_Sh%C5%8Djo_Madoka_Magika_%28Logo%29.svg.png',
              height: 150,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : const Center(
                        heightFactor: 3,
                        child: CircularProgressIndicator(),
                      );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  heightFactor: 3,
                  child: Text(
                    'ไม่สามารถโหลดรูปภาพได้',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // รูปจาก Assets
            Image.asset(
              'assets/images/logo.jpg',
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'เกิดข้อผิดพลาดในการโหลด Asset',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),

            const SizedBox(height: 20),

            // Container พร้อม Google Font
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'สวัสดี วิดเจ็ต Flutter!',
                textAlign: TextAlign.center,
                style: GoogleFonts.prompt(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ปุ่ม
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),

                const SizedBox(width: 10),

                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Text('Outlined'),
                ),

                const SizedBox(width: 10),

                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // IconButton
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 30,
              color: Colors.blueGrey,
              tooltip: 'ข้อมูล',
            ),
          ],
        ),
      ),
    );
  }
}