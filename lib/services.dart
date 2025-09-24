import 'dart:convert';
import 'package:http/http.dart' as http;
import './note.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<List<Note>> getNotes() async {
    final response = await http.get(Uri.parse('$baseUrl/notes'));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((note) => Note.fromJson(note)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  static Future<Note> addNote(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(note.toJson()),
    );
    if (response.statusCode == 201) {
      return Note.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add note');
    }
  }
}
