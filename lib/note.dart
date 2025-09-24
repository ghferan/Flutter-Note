class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(id: json['id'], title: json['title'], content: json['content']);
  }

  Map<String, dynamic> toJson() => {'title': title, 'content': content};
}
