extension DateTimeExt on DateTime {
  String toUiDate() {
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    final day = this.day.toString().padLeft(2, '0');
    return '$day ${months[this.month - 1]} , ${this.year}';
  }
}