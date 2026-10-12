import 'package:flutter/material.dart';
import '../main.dart';
import 'menu_detail_page.dart';
import 'order_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  final menu = [
    {
      'nama': 'Nasi Goreng',
      'harga': 15000,
      'gambar': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500',
      'deskripsi': 'Nasi goreng spesial dengan telur.'
    },
    {
      'nama': 'Ayam Geprek',
      'harga': 17000,
      'gambar': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500',
      'deskripsi': 'Ayam crispy dengan sambal pedas.'
    },
    {
      'nama': 'Mie Goreng',
      'harga': 12000,
      'gambar': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
      'deskripsi': 'Mie goreng gurih dan lezat.'
    },
    {
      'nama': 'Es Teh Manis',
      'harga': 5000,
      'gambar': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500',
      'deskripsi': 'Es teh manis yang menyegarkan.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Bu Sari'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderPage()),
            ).then((_) => setState(() {})),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Hai, selamat datang! 💗',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text('Pilih makanan favoritmu hari ini.'),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari menu...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 245,
            ),
            itemBuilder: (context, index) {
              final item = menu[index];

              return Card(
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MenuDetailPage(menu: item),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item['gambar'] as String,
                        height: 125,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox(
                          height: 125,
                          child: Center(child: Icon(Icons.restaurant, size: 40)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['nama'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Rp${item['harga']}'),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Icon(Icons.favorite, color: pink, size: 17),
                                SizedBox(width: 5),
                                Text('Favorit'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderPage()),
            ).then((_) => setState(() {})),
            icon: const Icon(Icons.shopping_bag),
            label: const Text('Lihat Keranjang'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: pink,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menu'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderPage()),
            ).then((_) => setState(() {}));
          }
        },
      ),
    );
  }
}