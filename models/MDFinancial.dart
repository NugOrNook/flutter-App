//กำหนดตัวแปร
class MDFinancial {
  int? ID_type_financial;
  int? ID_financial;
  int? ID_budget;
  String? type_financial;
  String? memo_financial;
  double? amount_financial;
  double? capital_budget;
  bool? type_expense;

  //medkiสร้าง constructor ของคลาส MDFinancial
  //รับค่าและกำหนดค่าให้กับแอตทริบิวต์ต่างๆ ของอ็อบเจ็กต์
  MDFinancial(
      {this.ID_type_financial,
      this.ID_financial,
      this.ID_budget,
      this.type_financial,
      this.memo_financial,
      this.amount_financial,
      this.capital_budget,
      this.type_expense});
}
