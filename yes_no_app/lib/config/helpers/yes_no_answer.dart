import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getYesNoAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesnoModel = YesNoModel.fromJson(response.data);

    return Message(text: yesnoModel.answer, 
    fromWho: FromWho.hers, 
    imageUrl: yesnoModel.image);
  }
}
