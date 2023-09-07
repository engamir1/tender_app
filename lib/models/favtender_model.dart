// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:tender_app_test/models/tender_model.dart';

part 'favtender_model.g.dart';

@HiveType(typeId: 1)
class FavTenderModel extends HiveObject {
  @HiveField(8)
  final String tender_title;
  @HiveField(9)
  final String entity;
  @HiveField(10)
  final String announcement_date;
  @HiveField(11)
  final String envelopes_opening_date;
  @HiveField(12)
  final String activity;
  @HiveField(13)
  final String? insurance;
  @HiveField(14)
  final bool isFav;
  @HiveField(15)
  final String id;

  FavTenderModel({
    required this.tender_title,
    required this.entity,
    required this.announcement_date,
    required this.envelopes_opening_date,
    required this.activity,
    this.insurance,
    required this.isFav,
    required this.id,
  });
}
