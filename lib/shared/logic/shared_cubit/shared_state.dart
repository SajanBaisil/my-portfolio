part of 'shared_cubit.dart';

class SharedState extends Equatable {
  const SharedState({this.selectedSection = SelectedSection.home});

  final SelectedSection selectedSection;

  @override
  List<Object?> get props => [selectedSection];

  SharedState copyWith({
    SelectedSection? selectedSection,
  }) {
    return SharedState(
        selectedSection: selectedSection ?? this.selectedSection);
  }
}
