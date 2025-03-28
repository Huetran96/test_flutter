import 'package:mobile_ui/data/destination.dart';

abstract class DestinationState{}
class DestinationLoading extends DestinationState{}
class DestinationLoaded extends DestinationState{
  final List<Destination>? destinations;

  DestinationLoaded({this.destinations});
}
class DestinationFulure extends DestinationState{
  final String? message;

  DestinationFulure({this.message});
}