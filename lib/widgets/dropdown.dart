// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dummyController.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

int globalIdx = -1;
late OverlayEntry floatingDropdown;
bool isDropdownOpen = false;
bool isError = false;
String selectionTxt = "";
List<bool> isSelectedList = List.empty();

void upadteSelections(int dataItems, int index, String dataValue) {
    if (isSelectedList.isEmpty)
      for (int i = 0; i < dataItems; i++) isSelectedList.add(false);
    else {
      for (int i = 0; i < dataItems; i++) {
        if (i != index) isSelectedList[i] = false;
      }
    }
  }

class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    Key? key,
    required this.hintText,
    required this.dataItems,
    required this.datavalues,
  }) : super(key: key) {
    dropdownKey = LabeledGlobalKey("$dataItems");
  }

  String? hintText;
  int? dataItems;
  List<String>? datavalues;
  late GlobalKey dropdownKey;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  late double wHeight, wWidth, xPos, yPos;

  void findDropdowndata(GlobalKey dropdownKey) {
    final RenderBox renderBox =
        dropdownKey.currentContext!.findRenderObject() as RenderBox;
    wHeight = renderBox.size.height;
    wWidth = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPos = offset.dx;
    yPos = offset.dy;
  }

  OverlayEntry createFloatingDropdown(int listItems, List<String> dataValues) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPos,
        width: wWidth,
        top: yPos + wHeight,
        height: listItems * wHeight + 40,
        child: DropdownC(
          itemHeight: wHeight,
          dataItems: listItems,
          dataValues: dataValues,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: widget.dropdownKey,
      onTap: () {
        isDropdownOpen = !isDropdownOpen;
        if (!isDropdownOpen) {
          floatingDropdown.remove();
        } else {
          findDropdowndata(widget.dropdownKey);
          floatingDropdown = createFloatingDropdown(
              widget.dataItems!, widget.datavalues!);
          Overlay.of(context)!.insert(floatingDropdown);
        }
        upadteSelections(widget.dataItems!, -1, "");
      },
      child: Container(
        height: DimentionLib.h80,
        decoration: BoxDecoration(
          color: ColorLib.fieldWhite,
          borderRadius: BorderRadius.circular(DimentionLib.r10),
          border: Border.all(
            color: isError
                ? ColorLib.errorColor
                : isDropdownOpen
                    ? ColorLib.huePrimaryBlue
                    : ColorLib.transp,
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: DimentionLib.w10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Visibility(
                  visible: isSelectedList.isNotEmpty,
                  child: Txt(
                    text: selectionTxt,
                    style: TxtStyleLib.bodyTxt,
                  ),
                ),
                Visibility(
                  visible: isSelectedList.isEmpty,
                  child: Txt(
                    text: widget.hintText!,
                    style: TxtStyleLib.hintTxt,
                  ),
                ),
              ],
            ),
            Container(
              width: DimentionLib.w24,
              height: DimentionLib.w24,
              decoration: BoxDecoration(
                color: ColorLib.greySpace.withOpacity(0.4),
                borderRadius: BorderRadius.circular(DimentionLib.r500),
              ),
              child: Center(
                child: Icon(
                  isDropdownOpen
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  color: !isDropdownOpen
                      ? ColorLib.greySpace
                      : ColorLib.huePrimaryBlue,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropdownC extends StatelessWidget {
  DropdownC({
    Key? key,
    required this.itemHeight,
    required this.dataItems,
    required this.dataValues,
  }) {
    for (int i = 0; i < dataItems!; i++) {
      dropdownItems.add(initItems(i));
    }
  }

  double? itemHeight;
  int? dataItems;
  List<String>? dataValues;
  List dropdownItems = <DropdownItem>[];

  DropdownItem initItems(int index) {
    if (index == 0)
      return DropdownItem.first(
        itemText: dataValues![index],
        itemHeight: itemHeight,
        idx: index,
        dataItems: dataItems,
      );
    else if (index == dataItems! - 1)
      return DropdownItem.last(
        itemText: dataValues![index],
        itemHeight: itemHeight,
        idx: index,
        dataItems: dataItems,
      );
    return DropdownItem(
      itemText: dataValues![index],
      itemHeight: itemHeight,
      idx: index,
      dataItems: dataItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: ColorLib.transp,
      child: Column(
        children: [
          SizedBox(height: DimentionLib.h5),
          Container(
            height: dataItems! * itemHeight!,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DimentionLib.r10),
            ),
            child: Column(
              //! Rebuild dropdown !!!!!!!!!!!!!!!!!!!!!!!
              children: [for (int i = 0; i < dataItems!; i++) dropdownItems[i]],
            ),
          )
        ],
      ),
    );
  }
}

class DropdownItem extends StatefulWidget {
  DropdownItem({
    Key? key,
    required this.itemText,
    this.itemHeight,
    this.isFirstItem = false,
    this.isLastItem = false,
    this.dataItems,
    this.idx,
  }) : super(key: key);

  double? itemHeight;
  String? itemText;
  int? dataItems, idx;
  bool? isFirstItem, isLastItem;

  factory DropdownItem.first(
      {String? itemText, double? itemHeight, int? idx, int? dataItems}) {
    return DropdownItem(
      itemText: itemText,
      itemHeight: itemHeight,
      idx: idx,
      dataItems: dataItems,
      isFirstItem: true,
    );
  }

  factory DropdownItem.last(
      {String? itemText, double? itemHeight, int? idx, int? dataItems}) {
    return DropdownItem(
      itemText: itemText,
      itemHeight: itemHeight,
      idx: idx,
      dataItems: dataItems,
      isLastItem: true,
    );
  }

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          selectionTxt = widget.itemText!;
          print(selectionTxt);
        });
        floatingDropdown.remove();
        isDropdownOpen = !isDropdownOpen;
      }),
      child: Container(
        height: widget.itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: widget.isFirstItem!
                ? Radius.circular(DimentionLib.r10)
                : Radius.zero,
            bottom: widget.isLastItem!
                ? Radius.circular(DimentionLib.r10)
                : Radius.zero,
          ),
          color: isSelectedList[widget.idx!]
              ? ColorLib.huePrimaryBlue.withOpacity(0.4)
              : ColorLib.huePrimaryBlue.withOpacity(0.2),
        ),
        padding: EdgeInsets.symmetric(horizontal: DimentionLib.w24),
        child: Row(
          children: [
            Txt(
              text: widget.itemText!,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: DimentionLib.sp16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: isSelectedList[widget.idx!]
                    ? ColorLib.creamWhite
                    : ColorLib.huePrimaryBlueDull,
              ),
            ),
            Spacer(),
            Icon(
              Icons.store_rounded,
              color: isSelectedList[widget.idx!]
                  ? ColorLib.creamWhite
                  : ColorLib.huePrimaryBlueDull,
            ),
          ],
        ),
      ),
    );
  }
}
