class TaskModel {
  String id;
  String title;
  String details;
  int date;
  bool state;
  TaskModel({
    this.id = '',
    required this.title,
    required this.details,
    required this.date,
    required this.state,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            date: json['date'],
            details: json['details'],
            state: json['state'],
            title: json['title']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'details': details,
      'state': state,
      'title': title
    };
  }
}
