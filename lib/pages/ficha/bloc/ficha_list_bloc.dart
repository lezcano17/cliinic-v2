import 'package:bloc/bloc.dart';
import 'package:cliinic_v2/pages/ficha/view/ficha_controller.dart';
import 'package:cliinic_v2/pages/ficha/view/ficha_screen.dart';
import 'package:equatable/equatable.dart';

part 'ficha_list_event.dart';
part 'ficha_list_state.dart';

class FichaListBloc extends Bloc<FichaListEvent, FichaListState> {
  List<Ficha> _originalList = [];
  FichaListBloc()
      : super(
          const FichaListState(
            listafichas: [],
          ),
        ) {
    on<FichaListMotivoFilterEvent>(_onFichaListMotivoFilterEvent);
    on<FichaListInitEvent>(_onFichaListInitEvent);
  }

  Future<void> _onFichaListInitEvent(
      FichaListInitEvent event, Emitter<FichaListState> emit) async {
    final result = await fetchFichas();
    emit(
      state.copyWith(
        listafichas: result,
      ),
    );
    _originalList = result;
  }

  void _onFichaListMotivoFilterEvent(
      FichaListMotivoFilterEvent event, Emitter<FichaListState> emit) {
    String motivo = event.motivo;
    List<Ficha> listaFichas = state.listafichas;
    List<Ficha> listaResult = [];

    for (Ficha ficha in listaFichas) {
      if (ficha.motivo.contains(motivo)) {
        listaResult.add(ficha);
      }
    }

    emit(
      state.copyWith(
        listafichas: listaResult,
      ),
    );
  }
}
