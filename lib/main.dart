//link GPT: https://chatgpt.com/share/6911f28b-4e90-8013-a210-f344ddc1ada9
import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const InstagramHome(),
    );
  }
}

class InstagramHome extends StatelessWidget {
  const InstagramHome({super.key});

  // Daftar data pengguna (user)
  final List<Map<String, String>> users = const [
    {"name": "Leri", "image": "https://randomuser.me/api/portraits/men/1.jpg"},
    {
      "name": "bella",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
    },
    {"name": "adam", "image": "https://randomuser.me/api/portraits/men/3.jpg"},
    {
      "name": "sinta",
      "image": "https://randomuser.me/api/portraits/women/4.jpg",
    },
    {
      "name": "rina",
      "image": "https://randomuser.me/api/portraits/women/5.jpg",
    },
    {"name": "deni", "image": "https://randomuser.me/api/portraits/men/6.jpg"},
    {
      "name": "vivi",
      "image": "https://randomuser.me/api/portraits/women/7.jpg",
    },
    {"name": "user8", "image": "https://randomuser.me/api/portraits/men/8.jpg"},
  ];

  // Daftar postingan
  final List<Map<String, String>> posts = const [
    {
      "username": "Leri",
      "userImage": "https://randomuser.me/api/portraits/men/1.jpg",
      "postImage":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800",
      "caption": "Menikmati senja di tepi pantai 🌅",
    },
    {
      "username": "bella",
      "userImage": "https://randomuser.me/api/portraits/women/2.jpg",
      "postImage":
          "https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800",
      "caption": "Liburan ke gunung, suasananya menenangkan 🍃",
    },
    {
      "username": "adam",
      "userImage": "https://randomuser.me/api/portraits/men/3.jpg",
      "postImage":
          "https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=800",
      "caption": "Belajar Flutter bikin UI mirip Instagram 😎",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Instagram', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // STORIES
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.pinkAccent,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(user['image']!),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(color: Colors.grey),

            // POSTINGAN
            Column(
              children: posts.map((post) {
                return Container(
                  color: Colors.black,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header user
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(post['userImage']!),
                        ),
                        title: Text(
                          post['username']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),

                      // Gambar postingan
                      Image.network(
                        post['postImage']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),

                      // Icon aksi
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_border, color: Colors.white),
                            SizedBox(width: 15),
                            Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.send_outlined, color: Colors.white),
                            Spacer(),
                            Icon(Icons.bookmark_border, color: Colors.white),
                          ],
                        ),
                      ),

                      // Deskripsi
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Disukai oleh Lala dan lainnya',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4,
                        ),
                        child: Text(
                          post['caption']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Lihat semua komentar',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),

      // Navigasi bawah
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
