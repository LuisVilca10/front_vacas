part of 'finca_bloc.dart';

@immutable
abstract class FincaEvent {}

class ListarFincaEvent extends FincaEvent {
  ListarFincaEvent() {
    print("Evento si");
  }
//ListarFincaEvent({required FincaModelo Finca}):super(Finca:Finca);
}

class DeleteFincaEvent extends FincaEvent {
  FincaModelo finca;
  DeleteFincaEvent(this.finca);
//DeleteFincaEvent({required FincaModelo Finca}):super(Finca:Finca);
}

class UpdateFincaEvent extends FincaEvent {
  FincaModelo finca;
  UpdateFincaEvent(this.finca);
//UpdateFincaEvent({required FincaModelo Finca}):super(Finca:Finca);
}

class CreateFincaEvent extends FincaEvent {
  FincaModelo finca;
  CreateFincaEvent(this.finca);
//CreateFincaEvent({required FincaModelo Finca}):super(Finca:Finca);
}
