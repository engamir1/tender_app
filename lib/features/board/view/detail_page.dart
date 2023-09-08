// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app_test/features/board/widgets/detail_section.dart';
import 'package:tender_app_test/features/board/widgets/simple_button.dart';

import 'package:tender_app_test/models/tender_model.dart';

import '../../../constants/text.dart';
import '../../../cubit/tender_cubit.dart';
import '../../../themes/text_style.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.inputList,
  }) : super(key: key);
  final List  inputList;

  @override
  Widget build(BuildContext context) {
 
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);

    int index = cubit.clickedIndex;
    TenderModel tender = inputList[index];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppText.details,
          style: AppTextStyle.tabsText,
        ),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " ${tender.tender_title} ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff006D94),
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cairo"),
                ),
              ),
              DataRowWidget(
                  icon: Icons.corporate_fare,
                  dataRecieved: tender.entity,
                  field_name: "الجهة"),
              // DataRowWidget(
              //     icon: Icons.tag,
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.purchase_no,
              //     field_name: "رقم العملية"),
              // DataRowWidget(
              //     icon: Icons.event_available,
              //     dataRecieved: tender.submission_date,
              //     field_name: "تاريخ النشر"),
              DataRowWidget(
                  icon: Icons.event,
                  color: const Color(0xffFCFCFC),
                  dataRecieved: tender.envelopes_opening_date,
                  field_name: "تاريخ فتح المظاريف"),
              // DataRowWidget(
              //     dataRecieved: dataRecieved.purchase_type,
              //     field_name: "نوع العملية"),
              // DataRowWidget(
              //     icon: Icons.engineering,
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.the_nature_purchasing,
              //     field_name: "طبيعة العملية"),
              // DataRowWidget(
              //     icon: Icons.check,
              //     dataRecieved: dataRecieved.status,
              //     field_name: "الحالة يمكن/ لايمكن التقدم"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.announcement_date,
              //     field_name: "تاريخ الاعلان"),
              // DataRowWidget(
              //     dataRecieved: dataRecieved.accept_retail,
              //     field_name: "تقبل العروض"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.alternative_offers,
              //     field_name: "عروض بديلة"),
              // DataRowWidget(
              //     dataRecieved: dataRecieved.evaluation_system,
              //     field_name: "نظام التقييم"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.book_price_for_large_companies,
              //     field_name: "سعر كراسة الشوط للشركات الكبيرة"),
              DataRowWidget(
                  dataRecieved: tender.insurance, field_name: "قيمة التأمين"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.micro_tender_book_price,
              //     field_name: "سعر كراسة الشروط للشركات الصغيرة"),
              DataRowWidget(
                  dataRecieved: tender.activity, field_name: "نشاط الاعمال"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.description,
              //     field_name: "الوصف"),
              // DataRowWidget(
              //     dataRecieved: dataRecieved.terms, field_name: "الشروط"),
              // DataRowWidget(
              //     color: const Color(0xffFCFCFC),
              //     dataRecieved: dataRecieved.notes,
              //     field_name: "ملاحظات عامة"),

              Container(
                padding: const EdgeInsets.all(10),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تحميل المرفقات",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff006D94),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Cairo"
                        // overflow: TextOverflow.clip,
                        ),
                  ),
                ),
              ),
              const Icon(
                Icons.picture_as_pdf,
                color: Color(0xff006D94),
                size: 50,
              ),
              // =================== add comment ============
              Container(
                padding: const EdgeInsets.all(10),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اضافة تعليق",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff006D94),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Cairo"
                        // overflow: TextOverflow.clip,
                        ),
                  ),
                ),
              ),

              Container(
                height: 150,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  textDirection: TextDirection.rtl,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: ' اكتب تعليق ... ',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 55,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SimpleButton(
                    name: "نشر التعليق",
                    onPressed: () {},
                  )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )
    );
  }
}


// Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xff006D94),
//             size: 30,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // check if tender obj in fav
//               if (inFav) {
//                 print("iam in remove ");
//                 provider.removeFavorite(dataRecieved);
//                 provider.setStatus(inFav);
//               } else {
//                 print("iam in add ");
//                 provider.addFavorite(dataRecieved);
//                 provider.setStatus(inFav);
//               }
//             },
//             icon: inFav
//                 ? const Icon(
//                     Icons.favorite, color: Colors.red,
//                     // isFavorite ? Icons.favorite : Icons.favorite_border,
//                     // // color: isFavorite ? Colors.red : null,
//                     // color: isFavorite ? const Color(0xff006D94) : null,
//                     size: 30,
//                   )
//                 : const Icon(
//                     Icons.favorite_border, color: Colors.white,
//                     // isFavorite ? Icons.favorite : Icons.favorite_border,
//                     // // color: isFavorite ? Colors.red : null,
//                     // color: isFavorite ? const Color(0xff006D94) : null,
//                     size: 30,
//                   ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.share,
//               color: Color(0xff006D94),
//               size: 30,
//             ),
//           ),
//         ],
//         centerTitle: true,
//         backgroundColor: const Color(0xffFED227),
//         title: const Text(
//           "تفاصيل العملية",
//           style: TextStyle(
//               fontSize: 18,
//               color: Color(0xff006D94),
//               fontWeight: FontWeight.w800,
//               fontFamily: "Cairo"),
//         ),
//       ),
//       body: 
//     )