part of 'body_controll_cubit.dart';

class BodyControllState extends Equatable {
  const BodyControllState({this.isExpanded = false});

  final bool isExpanded;

  @override
  List<Object> get props => [isExpanded];

  BodyControllState copyWith({
    bool? isExpanded,
  }) {
    return BodyControllState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
