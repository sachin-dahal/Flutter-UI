import 'package:esusu_social/common/kAppBar.dart';
import 'package:esusu_social/common/kButton.dart';
import 'package:esusu_social/common/kTextField.dart';
import 'package:esusu_social/common/styles.dart';
import 'package:esusu_social/modules/presentation/bill_payment/controller/bill_payment_controller.dart';
import 'package:esusu_social/modules/presentation/bill_payment/view/bill_confirm_payment.dart';
import 'package:esusu_social/modules/presentation/personal_details/controller/personal_details_controller.dart';
import 'package:esusu_social/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillPaymentDetailsPage extends StatelessWidget {
  final BillPaymentController _billPaymentController = Get.find();
  final String title;

  BillPaymentDetailsPage({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeON ? kDarkBackgroundColor : kBackgroundColor1,
      body: Container(
        child: Column(
          children: [
            KAppBar(text: title),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                children: [
                  SizedBox(height: 10.0),
                  Text("Mobile Number".toUpperCase(),
                      style: kLinkLabelStyle.copyWith(
                          color:
                              isDarkModeON ? kTertiaryColor : kPrimaryColor)),
                  SizedBox(height: 5.0),
                  KTextField(
                    isBgColor: isDarkModeON,
                    hintText: "Enter Mobile Number",
                  ),
                  SizedBox(height: 25.0),
                  Text("Select package".toUpperCase(),
                      style: kLinkLabelStyle.copyWith(
                          color:
                              isDarkModeON ? kTertiaryColor : kPrimaryColor)),
                  _buildDropDown(),
                ],
              ),
            ),
            KButton(
                text: "Next",
                onPressed: () => Get.to(BillConfirmPaymentPage(title: title))),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDown() {
    return Container(
      decoration: BoxDecoration(
        color: isDarkModeON ? kDarkBackgroundColor : Color(0xFFF0F2F4),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child:
          GetBuilder<BillPaymentController>(builder: (_billPaymentController) {
        return DropdownButton<String>(
          isExpanded: true,
          underline: Divider(
            color: Colors.grey[400],
            thickness: 1.5,
            height: 0.0,
          ),
          focusColor: isDarkModeON ? kDarkBackgroundColor : Color(0xFFF0F2F4),
          value: _billPaymentController.selectedItem,
          icon: Icon(FeatherIcons.chevronDown),
          dropdownColor: isDarkModeON ? kDarkBackgroundColor : kTextColor3,
          items: _billPaymentController.packageList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: isDarkModeON ? kTextColor3 : kTextColor1,
                        fontWeight: FontWeight.w500)),
              ),
            );
          }).toList(),
          onChanged: _billPaymentController.changeIndex,
        );
      }),
    );
  }
}
