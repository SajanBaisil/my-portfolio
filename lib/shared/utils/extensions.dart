extension CustomStringExt on String? {
  bool get isNullOrEmpty => this == null || (this ?? '').trim().isEmpty;
  bool get notNullNorEmpty =>
      this != null &&
      (this ?? '').trim().isNotEmpty &&
      (this ?? '').trim() != 'null';
  String get firstLetterToCap {
    if (isNullOrEmpty) return '';
    final temp = <String>[];
    this!.trim().split(' ').toList().forEach((element) {
      if (element.trim().isEmpty) return;
      temp.add(element[0].toUpperCase() + element.substring(1));
    });
    return temp.join(' ');
  }

  String get fromSecondHeadToLetterToCap {
    if (isNullOrEmpty) return '';
    final temp = <String>[];
    this!.trim().split(' ').toList().forEach((element) {
      if (element.trim().isEmpty) return;
      temp.add(element[0].toUpperCase() + element.substring(1));
    });
    final data = temp.join(' ');
    return data[0].toLowerCase() + data.substring(1);
  }

  String get onlyFirstToLetterToCap {
    if (isNullOrEmpty) return '';
    final temp = <String>[];
    this!.trim().split(' ').toList().forEach((element) {
      if (element.trim().isEmpty) return;
      temp.add(element.toLowerCase());
    });
    final data = temp.join(' ');
    return data[0].toUpperCase() + data.substring(1);
  }
}
