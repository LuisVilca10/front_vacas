import 'dart:async';

import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:vacas_front/repository/FincaRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'finca_event.dart';
part 'finca_state.dart';

class FincaBloc extends Bloc<FincaEvent, FincaState> {
  late final FincaRepository _fincaRepository;
  FincaBloc(this._fincaRepository) : super(FincaInitialState()) {
    on<FincaEvent>((event, emit) async{
      // TODO: implement event handler
      print("Bloc x");
      if(event is ListarFincaEvent){
        emit(FincaLoadingState());
        try{
          print("pasox!!");
          List<FincaModelo> PersonaList= await _fincaRepository.getFinca();
          emit(FincaLoadedState(PersonaList));
        } catch(e){
          emit(FincaError(e as Error)) ;
        }
      }else if(event is DeleteFincaEvent){
        try{
          await _fincaRepository.deleteFinca(event.finca!.id);
          emit(FincaLoadingState());
          List<FincaModelo> PersonaList= await _fincaRepository.getFinca();
          emit(FincaLoadedState(PersonaList));
        }catch(e){
          emit(FincaError(e as Error));
        }
      }else if(event is CreateFincaEvent){
        try{
          await _fincaRepository.createFinca(event.finca!);
          emit(FincaLoadingState());
          List<FincaModelo> PersonaList= await _fincaRepository.getFinca();
          emit(FincaLoadedState(PersonaList));
        }catch(e){
          emit(FincaError(e as Error));
        }
      }else if(event is UpdateFincaEvent){
        try{
          await _fincaRepository.updateFinca(event.finca!.id, event.finca!);
          emit(FincaLoadingState());
          List<FincaModelo> PersonaList= await _fincaRepository.getFinca();
          emit(FincaLoadedState(PersonaList));
        }catch(e){
          emit(FincaError(e as Error));
        }
      }
    });
  }
}
