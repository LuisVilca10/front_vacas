part of 'finca_bloc.dart';

@immutable
abstract class FincaState {}

class FincaInitialState extends FincaState {}
class FincaLoadingState extends FincaState{}
class FincaLoadedState extends FincaState{
  List<FincaModelo> FincaList;
  FincaLoadedState(this.FincaList);
}
class FincaError extends FincaState{
  Error e;
  FincaError(this.e);
}
