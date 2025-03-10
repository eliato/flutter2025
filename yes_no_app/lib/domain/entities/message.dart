
enum FromWho { me, hers }


class Message {


  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({this.imageUrl, required this.text, required this.fromWho});


}
