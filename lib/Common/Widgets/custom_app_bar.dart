import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:dijelac/Utils/Themes/text_theme.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';


class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key, required this.title,this.leadingWidget, this.leading = false, this.trailing= false, this.trailingFunc,this.trailingWidget})
      : super(key: key);
  String? title;
  bool leading;
  Widget? leadingWidget;
  bool trailing;
  Widget? trailingWidget;
  Function()? trailingFunc;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: XColors.secondaryColor,
      width: XHelperFunctions.screenWidth(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.leading
                ? GestureDetector(
                    onTap: () {
                      if (FocusManager.instance.primaryFocus!.hasFocus) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.arrow_back_rounded,color: XColors.textColor,
                      size: 22,)
                    ),
                  ) : widget.leadingWidget != null ?  widget.leadingWidget!
                : SizedBox(
                    width: XHelperFunctions.screenWidth() * 0.12,
                  ),
            Expanded(
              child: Center(
                child: Row(mainAxisSize:MainAxisSize.min ,
                  children: [
                    Text(
                      widget.title.toString(),
                      style:
                          XTextThemes.lightTextTheme.headlineMedium!.copyWith(color: XColors.textColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            widget.trailing ? GestureDetector(
              onTap:widget.trailingFunc ?? () {
              },
              child: Icon(Icons.more_vert_rounded,color: XColors.textColor,size: 32,)
            ) : widget.trailingWidget != null ?  widget.trailingWidget! : SizedBox(width: XHelperFunctions.screenWidth() * 0.12),
             SizedBox(width: XHelperFunctions.screenWidth() * 0.01,),
          ],
        ),
      ),
    );
  }
}
