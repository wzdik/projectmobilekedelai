import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelacakan Pesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Nomor Pesanan Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nomor Pesanan',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                // Logika pencarian status pesanan
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.local_shipping),
                    title: Text('Status: Pesanan Sedang Dikemas'),
                    subtitle: Text('Estimasi Pengiriman: 2 Hari'),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text('Riwayat: Pesanan Diterima'),
                    subtitle: Text('Tanggal: 24 September 2024'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
