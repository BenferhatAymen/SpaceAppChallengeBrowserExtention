class DataSetsModel {
  String id;
  String title;
  String description;
  String authorImage;
  String authorTitle;
  String dateModified;
  int filesNumber;
  int usability;

  DataSetsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.authorImage,
    required this.authorTitle,
    required this.dateModified,
    required this.filesNumber,
    required this.usability,
  });
  factory DataSetsModel.fromJson(json) {
    return DataSetsModel(
      title: json['title'],
      description: json['description'],
      id: json['_id'],
      authorImage: json['authorImage'],
      authorTitle: json['authorTitle'],
      dateModified: json['dateModified'][0] as String,
      filesNumber: json['filesNumber'],
      usability: json['usability'],
    );
  }
}
