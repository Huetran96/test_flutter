import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ui/bloc/destination_state.dart';
import 'package:mobile_ui/data/destination.dart';

class DestinationBloc extends Cubit<DestinationState>{
  DestinationBloc(): super(DestinationLoading());

  Future<void> fetchData() async{
    final Dio dio = Dio();
    final url = 'http://10.0.2.2:8080/travel';
    try{
      var response = await dio.get(url);
      if(response.statusCode == 200){
        var destinations = List.from(response.data).map((item) => Destination.fromJson(item)).toList();
        emit(DestinationLoaded(destinations: destinations));
      }else{
        emit(DestinationFulure(message: 'Error on fetch data, try again!'));
      }
    }on DioException catch(e){
        emit(DestinationFulure(message: e.response.toString()));
    }
  }

}