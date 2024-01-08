List<String> _monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

extension DateTimeExt on DateTime {
  String toFormattedDatetime() {
    final String monthName = _monthNames[month - 1];
    return '$day $monthName $year';
  }
}
