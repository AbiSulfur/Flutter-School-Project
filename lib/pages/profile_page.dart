import 'package:flutter/material.dart';
import 'package:flutter_12rpl/models/song_model.dart';
import 'package:flutter_12rpl/pages/favorite_page.dart';
import 'package:flutter_12rpl/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final List<Song> allSongs;

  const ProfilePage({super.key,required this.allSongs,});

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavoriteProvider>();
    final likeCount = favProvider.favoriteIds.length; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: const Color(0xFF6366F1),
              backgroundImage: const AssetImage('image/Abigail-2.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benedictus Abigail Triwiyatno',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Music Enthusiast',
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('$likeCount', 'Liked'),
                  Container(width: 1, height: 24, color: Colors.white10),
                  _buildStatItem('24h', 'Streamed'),
                  Container(width: 1, height: 24, color: Colors.white10),
                  _buildStatItem('5', 'Playlists'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildMenuItem(
              Icons.favorite_rounded,
              'Favorites Songs',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(allSongs: allSongs),
                  ),
                );
              },
            ),
            _buildMenuItem(Icons.history_rounded, 'Recently Played'),
            _buildMenuItem(Icons.storage_rounded, 'Clear Cache Data'),
            _buildMenuItem(Icons.settings_rounded, 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6366F1),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: const Color(0xFF151922),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Icon(icon, color: const Color(0xFF6366F1), size: 22),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: Colors.grey,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}