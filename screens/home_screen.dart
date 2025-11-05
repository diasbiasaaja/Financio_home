import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FOTO PROFIL + NAMA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat Datang,',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            'Dias Andhika',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.notifications_outlined,
                    size: 28,
                    color: Colors.black87,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const AtmCard(),

              const SizedBox(height: 20),
              const Text(
                "Kategori Transaksi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),
              // GRID MENU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  GridMenuItem(icon: Icons.fastfood, title: "Makanan"),
                  GridMenuItem(icon: Icons.local_hospital, title: "Kesehatan"),
                  GridMenuItem(icon: Icons.event, title: "Event"),
                  GridMenuItem(icon: Icons.shopping_bag, title: "Fashion"),
                  GridMenuItem(icon: Icons.history, title: "Riwayat"),
                ],
              ),

              const SizedBox(height: 25),
              const Divider(thickness: 1, color: Colors.grey),

              const SizedBox(height: 10),
              const Text(
                "Transaksi Terbaru",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),
              const TransactionItem(
                title: "Gojek Makanan",
                subtitle: "02 Nov 2025",
                amount: "- Rp45.000",
                icon: Icons.fastfood,
                iconColor: Colors.orange,
              ),
              const TransactionItem(
                title: "Pembelian Event Tiket",
                subtitle: "01 Nov 2025",
                amount: "- Rp150.000",
                icon: Icons.event,
                iconColor: Colors.orange,
              ),
              const TransactionItem(
                title: "Top Up Saldo",
                subtitle: "30 Okt 2025",
                amount: "+ Rp500.000",
                icon: Icons.account_balance_wallet,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVBAR
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(thickness: 1, color: Colors.grey),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profil',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
