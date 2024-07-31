class MessagesModel {
  final String message;
  final String date;
  final String id;
  MessagesModel({required this.message, required this.id, required this.date});
  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      message: json['message'],
      id: json['id'],
      date: json['date'],
    );
  }
}
