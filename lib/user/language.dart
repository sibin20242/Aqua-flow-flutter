import 'package:flutter/material.dart';



class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage = 'System Default';

  final List<String> languages = [
    'System Default',
    'Assamese',
    'Bengali',
    'Bodo',
    'Dogri',
    'English',
    'Gujarati',
    'Hindi',
    'Kannada',
    'Kashmiri',
    'Konkani',
    'Malayalam',
    'Marathi',
    'Nepali',
    'Oriya',
    'Punjabi',
    'Sanskrit',
    'Sindhi',
    'Tamil',
    'Telugu',
    'Urdu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AQUA FLOW"),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue[900]),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue[900],
              width: double.infinity,
              child: Text(
                "LANGUAGE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                icon: Icon(Icons.arrow_drop_down),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Language',
                  prefixIcon: Icon(Icons.language),
                ),
                items: languages.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(
                      language.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
