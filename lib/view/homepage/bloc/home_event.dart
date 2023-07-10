part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//INITIAL
class HomeInitialEvent extends HomeEvent {
  final int selectedSeat = 0;
}

//SELECTED SEAT
class HomeSearchSeatEvent extends HomeEvent {
  final int selectedSeat;

  HomeSearchSeatEvent({required this.selectedSeat});
}

//INVALID SEAT
class HomeInvalidSeatEvent extends HomeEvent {}