import 'package:flutter/material.dart';
import 'user_list_screen.dart';
import 'post_list_screen.dart';
import 'package:provider/provider.dart';
import '../repositories/post_repository.dart';

/// Halaman utama aplikasi RPL dan Keamanan.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postRepository = context.read<PostRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPL & Keamanan'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 24),

              const Text(
                'Prinsip RPL & Keamanan Kode',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostListScreen(postRepository: postRepository),
                    ),
                  );
                },
                child: const Text('Lihat Daftar Post'),
              ),

              const Text(
                'Pertemuan 6 - Pemrograman Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.people),
                  label: const Text('Lihat Daftar Pengguna'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserListScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
