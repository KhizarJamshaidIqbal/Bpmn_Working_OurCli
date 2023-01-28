
class Invoice {
  final InvoiceInfo info;

  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.items,
  });
}

class InvoiceInfo {
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String nameoftest;
  final String value;
  final String pulse;
  final String totalAverage;
  final String unitName;

  const InvoiceItem({
    required this.nameoftest,
    required this.value,
    required this.pulse,
    required this.totalAverage,
    required this.unitName,
  });
}
