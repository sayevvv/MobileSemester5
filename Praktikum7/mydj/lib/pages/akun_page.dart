import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  // Sample user data - in real app, this would come from a data source
  final String userName = 'Abdullah Shamil Basayev';
  final String userEmail = 'shamil@mydj.com';
  final String userRole = 'Guru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              ),
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      _getInitials(userName),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // User Name
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  // User Email
                  Text(
                    userEmail,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  // User Role Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      userRole,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Account Options List
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMenuSection(
                    context,
                    title: 'Profil',
                    items: [
                      _MenuItem(
                        icon: Icons.person_outline,
                        title: 'Edit Profil',
                        onTap: () => _showComingSoonDialog(context, 'Edit Profil'),
                      ),
                      _MenuItem(
                        icon: Icons.lock_outline,
                        title: 'Ubah Password',
                        onTap: () => _showComingSoonDialog(context, 'Ubah Password'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildMenuSection(
                    context,
                    title: 'Pengaturan',
                    items: [
                      _MenuItem(
                        icon: Icons.notifications_none,
                        title: 'Notifikasi',
                        onTap: () => _showComingSoonDialog(context, 'Notifikasi'),
                      ),
                      _MenuItem(
                        icon: Icons.language,
                        title: 'Bahasa',
                        subtitle: 'Indonesia',
                        onTap: () => _showComingSoonDialog(context, 'Pengaturan Bahasa'),
                      ),
                      _MenuItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Tema',
                        subtitle: 'Terang',
                        onTap: () => _showComingSoonDialog(context, 'Pengaturan Tema'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildMenuSection(
                    context,
                    title: 'Lainnya',
                    items: [
                      _MenuItem(
                        icon: Icons.help_outline,
                        title: 'Bantuan & Dukungan',
                        onTap: () => _showComingSoonDialog(context, 'Bantuan & Dukungan'),
                      ),
                      _MenuItem(
                        icon: Icons.info_outline,
                        title: 'Tentang Aplikasi',
                        onTap: () => Navigator.pushNamed(context, '/tentang'),
                      ),
                      _MenuItem(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Kebijakan Privasi',
                        onTap: () => _showComingSoonDialog(context, 'Kebijakan Privasi'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => _showLogoutDialog(context),
                      icon: Icon(Icons.logout, color: Colors.red),
                      label: Text(
                        'Keluar',
                        style: TextStyle(color: Colors.red),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Version Info
                  Text(
                    'MyDJ v0.1 (Beta)',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get user initials
  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }

  // Build menu section with title and items
  Widget _buildMenuSection(
    BuildContext context, {
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Column(
            children: items.map((item) {
              final isLast = item == items.last;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item.icon, color: Theme.of(context).colorScheme.primary),
                    title: Text(item.title),
                    subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: item.onTap,
                  ),
                  if (!isLast) Divider(height: 1, indent: 56),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Show coming soon dialog for features not yet implemented
  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Segera Hadir'),
        content: Text('Fitur "$feature" akan segera tersedia pada versi mendatang.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Keluar'),
        content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to home
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Berhasil keluar'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(
              'Keluar',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// Menu item model
class _MenuItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
