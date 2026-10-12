import 'package:flutter/material.dart';
import '../main.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int get total => keranjang.fold<int>(
        0,
        (sum, item) =>
            sum + (item['harga'] as int) * (item['jumlah'] as int),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Saya')),
      body: keranjang.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 70, color: pink),
                  SizedBox(height: 12),
                  Text('Keranjang masih kosong'),
                  Text('Yuk, pilih menu favoritmu!'),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...List.generate(keranjang.length, (index) {
                  final item = keranjang[index];

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: pinkMuda,
                        child: Icon(Icons.restaurant, color: pink),
                      ),
                      title: Text(item['nama'] as String),
                      subtitle: Text(
                        'Rp${item['harga']} x ${item['jumlah']}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: pink),
                        onPressed: () => setState(() {
                          keranjang.removeAt(index);
                        }),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('Total Pembayaran'),
                        const SizedBox(height: 8),
                        Text(
                          'Rp$total',
                          style: const TextStyle(
                            color: pink,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            final nomor =
                                DateTime.now().millisecondsSinceEpoch
                                    .toString()
                                    .substring(8);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Pesanan Berhasil! 💗'),
                                content: Text(
                                  'Nomor pesanan: BS$nomor\n'
                                  'Total pembayaran: Rp$total\n\n'
                                  'Silakan tunjukkan pesanan ini ke kasir.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() => keranjang.clear());
                                      Navigator.pop(context);
                                      Navigator.popUntil(
                                        context,
                                        (route) => route.isFirst,
                                      );
                                    },
                                    child: const Text('Selesai'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_circle),
                          label: const Text('Konfirmasi Pesanan'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}