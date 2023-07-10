part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

//DEFAULT

class HomeInitial extends HomeState {}

//UI

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final int selectedSeat;

  HomeLoadedState({required this.selectedSeat});
}

class HomeErrorState extends HomeState {}

//ACTION

abstract class HomeActionState extends HomeState {}

class HomeShowSnackBarState extends HomeActionState {}