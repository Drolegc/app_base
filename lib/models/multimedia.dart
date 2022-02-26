class Multimedia {
  late int id;
  late String url;

  Multimedia({required this.id,required this.url});

  factory Multimedia.fromJson(Map<String, dynamic> json){
    return Multimedia(
      id: json['id'] ?? 0,
      url: json['formats']['large']['url'] ?? ""
    );
  }

}