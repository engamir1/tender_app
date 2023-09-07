part of 'tender_cubit.dart';

@immutable
sealed class TenderState {}

final class TenderInitial extends TenderState {}

final class LoadingTender extends TenderState {}

final class SuccessTender extends TenderState {}

final class UpdatedTender extends TenderState {}

class ErrorTender extends TenderState {
  final String err;
  ErrorTender({required this.err});
}

final class TimeTender extends TenderState {}

final class HaveLength extends TenderState {}

final class ChangeINdex extends TenderState {}
//----------------- drawer section --------------------------

final class OpenDrawer extends TenderState {}

final class CloseDrawer extends TenderState {}

//----------------- Search section --------------------------
final class LoadingSearchState extends TenderState {}

final class SuccessSearchState extends TenderState {}

final class FaildSearchState extends TenderState {}

final class SearchState extends TenderState {}

//----------------- favorite section --------------------------
final class LoaddingFavState extends TenderState {}

final class IsFavState extends TenderState {}

final class NotFavState extends TenderState {}
final class ChangeIsFavState extends TenderState {}


final class SuccesLoaddingFavState extends TenderState {}

// --------------- connection status --------------------------
final class OnlineConnectionState extends TenderState {}

final class OfflineState extends TenderState {}
