import 'package:flutter/material.dart';
import '../main.dart';
import 'order_page.dart';

class MenuDetailPage extends StatefulWidget {
  final Map<String, dynamic> menu;

  const MenuDetailPage({super.key, required this.menu});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    final item = widget.menu;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Menu')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              item['gambar'] as String,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 240,
                child: Icon(Icons.restaurant, size: 70),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item['nama'] as String,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Rp${item['harga']}',
            style: const TextStyle(
              fontSize: 21,
              color: pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(item['deskripsi'] as String),
          const SizedBox(height: 24),
          const Text(
            'Jumlah Pesanan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: jumlah > 1 ? () => setState(() => jumlah--) : null,
                icon: const Icon(Icons.remove_circle),
              ),
              Text('$jumlah', style: const TextStyle(fontSize: 20)),
              IconButton(
                onPressed: () => setState(() => jumlah++),
                icon: const Icon(Icons.add_circle, color: pink),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              tambahPesanan(item, jumlah);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu ditambahkan ke keranjang!')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const OrderPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Tambah ke Keranjang'),
          ),
        ],
      ),
    );
  }
}