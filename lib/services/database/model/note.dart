class Note {
  final int id;
  final String title;
  final String content;
  final String createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert a map to a Note object
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  // Convert a Note object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }
}
