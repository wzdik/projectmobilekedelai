import 'package:flutter/material.dart';
import 'package:kedelai_hub/LoginScreen.dart';
import 'package:kedelai_hub/order_tracking_screen.dart';
import 'package:kedelai_hub/remote_order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kedalai_hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DashboardScreen(),
    SavingsScreen(),
    TransactionsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Aksi ketika ikon notifikasi ditekan
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika ikon pengaturan ditekan
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Tabungan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Halaman Dashboard
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightGreenAccent, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _buildDashboardCard(Icons.store, 'Manajemen Produk', Colors.greenAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsScreen()));
          }),
          _buildDashboardCard(Icons.bar_chart, 'Laporan Penjualan', Colors.orangeAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SalesReportScreen()));
          }),
          _buildDashboardCard(Icons.person, 'Pengaturan Akun', Colors.blueAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettingsScreen()));
          }),
          _buildDashboardCard(Icons.shopping_cart, 'Pembelian Produk', Colors.redAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PurchaseScreen()));
          }),
          _buildDashboardCard(Icons.history, 'Riwayat Pembelian', Colors.purpleAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PurchaseHistoryScreen()));
          }),
          _buildDashboardCard(Icons.support_agent, 'Dukungan Pelanggan', Colors.pinkAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerSupportScreen()));
          }),
          _buildDashboardCard(Icons.delivery_dining, 'Pesan Jarak Jauh', Colors.cyanAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RemoteOrderScreen()));
          }),
          _buildDashboardCard(Icons.track_changes, 'Pelacakan Pesanan', Colors.yellowAccent, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderTrackingScreen()));
          }),
        ],
      ),
    );
  }

  // Fungsi untuk membuat card dengan warna yang berbeda-beda
  Widget _buildDashboardCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.green.withAlpha(30),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 60, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Definisikan semua halaman sebagai turunan dari StatelessWidget
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Produk'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.store),
            title: Text('Produk $index'),
            subtitle: Text('Harga: Rp ${10000 + (index * 1000)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Aksi saat produk diklik
            },
          );
        },
      ),
    );
  }
}

class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Penjualan'),
      ),
      body: const Center(
        child: Text('Laporan Penjualan'),
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Akun'),
      ),
      body: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nama Pengguna'),
            subtitle: Text('Pengguna Kedelai'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('pengguna@kedelaihub.com'),
          ),
        ],
      ),
    );
  }
}

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelian Produk'),
      ),
      body: const Center(
        child: Text('Pembelian Produk'),
      ),
    );
  }
}

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pembelian'),
      ),
      body: const Center(
        child: Text('Riwayat Pembelian'),
      ),
    );
  }
}

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dukungan Pelanggan'),
      ),
      body: const Center(
        child: Text('Dukungan Pelanggan'),
      ),
    );
  }
}

// Halaman Tabungan
class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabungan'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Saldo Tabungan: Rp 5,000,000',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Aksi untuk menambah saldo
            },
            child: const Text('Tambah Saldo'),
          ),
          ElevatedButton(
            onPressed: () {
              // Aksi untuk tarik saldo
            },
            child: const Text('Tarik Saldo'),
          ),
        ],
      ),
    );
  }
}

// Halaman Riwayat Transaksi
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.money),
            title: Text('Transaksi $index'),
            subtitle: Text('Tanggal: ${DateTime.now().toLocal()}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Aksi saat transaksi diklik
            },
          );
        },
      ),
    );
  }
}

// Halaman Profil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
      ),
      body: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nama Pengguna'),
            subtitle: Text('Pengguna Kedelai'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('pengguna@kedelaihub.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telepon'),
            subtitle: Text('+62 123 456 789'),
          ),
        ],
      ),
    );
  }
}
