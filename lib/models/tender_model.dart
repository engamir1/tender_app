// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'tender_model.g.dart';

@HiveType(typeId: 0)
class TenderModel extends HiveObject {
  @HiveField(0)
  final String tender_title;
  @HiveField(1)
  final String entity;
  @HiveField(2)
  final String announcement_date;
  @HiveField(3)
  final String envelopes_opening_date;
  @HiveField(4)
  final String activity;
  @HiveField(5)
  final String? insurance;
  @HiveField(6)
  bool isFav;
  @HiveField(7)
  final String id;

  TenderModel({
    required this.tender_title,
    required this.entity,
    required this.announcement_date,
    required this.envelopes_opening_date,
    required this.activity,
    this.insurance,
    this.isFav = false,
    required this.id,
  });

  factory TenderModel.fromjson(var tender) {
    return TenderModel(
      tender_title: tender["tender_title"],
      entity: tender["entity"],
      announcement_date: tender["announcement_date"],
      envelopes_opening_date: tender["envelopes_opening_date"],
      activity: tender["activity"],
      insurance: tender["insurance"],
      id: tender["_id"],
    );
  }
}


//     throw Exception('Failed to get tender models');
