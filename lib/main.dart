import 'package:flutter/material.dart';

import 'pages/menu_list_page.dart';
import 'pages/menu_detail_page.dart';
import 'pages/order_page.dart';

void main() => runApp(const MyApp());

const pink = Color(0xFFE75480);
const pinkMuda = Color(0xFFFFF0F5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Bu Sari',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: pink),
        scaffoldBackgroundColor: pinkMuda,
        appBarTheme: const AppBarTheme(
          backgroundColor: pink,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MenuListPage(),
    );
  }
}

// Data keranjang sederhana
List<Map<String, dynamic>> keranjang = [];

void tambahPesanan(Map<String, dynamic> menu, int jumlah) {
  final index = keranjang.indexWhere((e) => e['nama'] == menu['nama']);

  if (index >= 0) {
    keranjang[index]['jumlah'] += jumlah;
  } else {
    keranjang.add({...menu, 'jumlah': jumlah});
  }
}