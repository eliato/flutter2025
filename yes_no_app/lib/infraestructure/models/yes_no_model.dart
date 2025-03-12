class YesNoModel {
  final String answer;
  final String forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

YesNoModel.fromJson(Map<String, dynamic> json)
      : answer = json['answer'],
        forced = json['forced'],
        image = json['image'];


}
