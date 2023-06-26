part of 'ficha_list_bloc.dart';

abstract class FichaListEvent extends Equatable {
  const FichaListEvent();

  @override
  List<Object> get props => [];
}

class FichaListInitEvent extends FichaListEvent {
  final List<Ficha> listaFicha;

  const FichaListInitEvent({required this.listaFicha});
}

class FichaListMotivoFilterEvent extends FichaListEvent {
  final String motivo;

  const FichaListMotivoFilterEvent({
    required this.motivo,
  });
}

class FichaListFechaFilterEvent extends FichaListEvent {
  final String fecha;

  const FichaListFechaFilterEvent({
    required this.fecha,
  });
}

class FichaDoctorIdFilerEvent extends FichaListEvent {
  final String doctorId;

  const FichaDoctorIdFilerEvent({
    required this.doctorId,
  });
}

class FichaPacienteIdFilterEvent extends FichaListEvent {
  final String pacienteId;

  const FichaPacienteIdFilterEvent({
    required this.pacienteId,
  });
}
