part of 'ficha_list_bloc.dart';

class FichaListState extends Equatable {
  const FichaListState({required this.listafichas});

  final List<Ficha> listafichas;

  FichaListState copyWith({List<Ficha>? listafichas}) {
    return FichaListState(
      listafichas: listafichas ?? this.listafichas,
    );
  }

  @override
  List<Object> get props => [listafichas];
}
