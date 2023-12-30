part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

class InternetlossState extends InternetState {}

class InternetGainState extends InternetState {}
