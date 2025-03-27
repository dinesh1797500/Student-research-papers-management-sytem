import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultsScreen extends StatelessWidget {
  final PlatformFile? file;
  final int userId;

  const ResultsScreen({super.key, this.file, required this.userId});

  Future<Map<String, dynamic>> _fetchPlagiarismResult(
    PlatformFile? file,
    int userId,
  ) async {
    if (file == null || file.path == null) {
      return {
        "success": false,
        "message": "No file provided",
        "plagiarism_percentage": "0%",
      };
    }

    const String apiUrl =
        'http://192.168.89.247/Research%20paper%20management%20system/plagiarism_api.php';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['user_id'] = userId.toString();
      request.files.add(await http.MultipartFile.fromPath('file', file.path!));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = jsonDecode(responseData);

      return data;
    } catch (e) {
      print('Error fetching plagiarism: $e');
      return {
        "success": false,
        "message": "Error checking plagiarism",
        "plagiarism_percentage": "0%",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plagiarism Report"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchPlagiarismResult(file, userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error checking plagiarism"));
            }

            final result =
                snapshot.data ??
                {"success": false, "plagiarism_percentage": "0%"};
            final plagiarismPercentage =
                result['plagiarism_percentage'] ?? "0%";

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "File: ${file?.name ?? 'No file selected'}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Plagiarism Score:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      plagiarismPercentage,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Plagiarism Percentage: $plagiarismPercentage",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "How to Reduce Plagiarism:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1. Paraphrase ideas in your own words.\n"
                    "2. Cite sources correctly (IEEE format).\n"
                    "3. Use plagiarism detection tools before submission.\n"
                    "4. Add personal analysis and insights.\n"
                    "5. Use quotation marks for exact words.\n"
                    "6. Manage and organize references properly.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "IEEE Research Paper Rules & Guidelines:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1. **Title & Abstract:** Must clearly define the research scope.\n"
                    "2. **Author Information:** List names, affiliations, and emails.\n"
                    "3. **Formatting:** Use IEEE two-column format with proper spacing.\n"
                    "4. **Citations & References:** Must follow IEEE citation style.\n"
                    "8. **Plagiarism Limit:** IEEE allows a maximum similarity index of 30%.\n"
                    "9. **Ethics & Integrity:** No falsification, fabrication, or duplicate submissions.\n"
                    "10. **Submission & Review:** Must be submitted through IEEE-approved platforms.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Go Back"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
