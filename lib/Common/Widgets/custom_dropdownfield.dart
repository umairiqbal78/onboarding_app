import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:dijelac/Utils/Themes/text_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class XCustomDropDownField extends StatefulWidget {
  XCustomDropDownField(
      {super.key,
      required this.controller,
      required this.context,
      required this.textController,
      this.value,
      required this.hintText,
      required this.dropDownList});
  GetxController controller;
  BuildContext context;
  TextEditingController textController;
  String? value;
  String hintText;
  List<String> dropDownList;

  @override
  State<XCustomDropDownField> createState() => _XCustomDropDownFieldState();
}

class _XCustomDropDownFieldState extends State<XCustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Text(
                widget.textController.text.isNotEmpty
                    ? widget.textController.text
                    : widget.hintText,
                style: widget.textController.text.isNotEmpty
                    ? XTextThemes.lightTextTheme.bodyMedium
                    : XTextThemes.lightTextTheme.bodyMedium!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: XColors.hintTextColor),
              ),
            ),
          ],
        ),
        items: widget.dropDownList
            .map((item) => DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(item.toString(),
                      style: XTextThemes.lightTextTheme.bodyMedium),
                  onTap: () {
                    widget.textController.text = item;
                    widget.controller.update();
                  },
                ))
            .toList(),
        value: widget.textController.text.isNotEmpty
            ? widget.textController.text
            : null,
        onChanged: (_) {},
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          size: 32,
          color: XColors.textColor,
        ),
        iconSize: 14,
        iconEnabledColor: XColors.textColor,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: XHelperFunctions.screenWidth(),
        buttonPadding: const EdgeInsets.only(left: 12, right: 06),
        buttonDecoration: BoxDecoration(
            border: Border.all(color: XColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(12),
            color: XColors.whiteColor),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 08, right: 10),
        dropdownMaxHeight: 200,
        dropdownWidth: MediaQuery.of(context).size.width * 0.85,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          border: Border.all(color: XColors.textColor),
          borderRadius: BorderRadius.circular(14),
          color: XColors.secondaryColor,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, -10),
      ),
    );
  }
}
