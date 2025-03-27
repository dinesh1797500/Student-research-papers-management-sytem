import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryScreen extends StatelessWidget {
  final int userId;

  const HistoryScreen({super.key, required this.userId});

  Future<List<Map<String, dynamic>>> fetchUploadHistory() async {
    const String apiUrl =
        'http://192.168.89.247/Research%20paper%20management%20system/history.php';
    try {
      final response = await http
          .post(
            Uri.parse(apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'user_id': userId}),
          )
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          return List<Map<String, dynamic>>.from(data['papers']);
        }
      }
      return [];
    } catch (e) {
      print('Error fetching history: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload History"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: userId,
            ); // Pass userId
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchUploadHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Error loading history",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          final uploadedPapers = snapshot.data ?? [];

          return uploadedPapers.isEmpty
              ? const Center(
                child: Text(
                  "No uploaded papers yet.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: uploadedPapers.length,
                itemBuilder: (context, index) {
                  final paper = uploadedPapers[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                        size: 40,
                      ),
                      title: Text(
                        paper["fileName"] ?? "Unknown File",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Plagiarism Status: ${paper["plagiarism"] ?? 'Pending'}",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              paper["plagiarism"] == "Pending"
                                  ? Colors.orange
                                  : Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // TODO: Implement delete functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Delete functionality coming soon!",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: "Upload",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Conferences",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                '/home',
                arguments: userId,
              );
              break;
            case 1:
              break; // Already on History
            case 2:
              Navigator.pushReplacementNamed(context, '/conferences');
              break;
            case 3:
              Navigator.pushReplacementNamed(
                context,
                '/profile',
                arguments: userId,
              );
              break;
          }
        },
      ),
    );
  }
}
