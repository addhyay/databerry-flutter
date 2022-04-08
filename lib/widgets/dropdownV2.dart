// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

List<bool> isSelectedList = [];
late OverlayEntry floatingBox;
String selectedChoice = "";
bool isDropdownOpen = false;

void updateSelections(int dataItems, int index) {
  if (isSelectedList.isEmpty)
    for (int i = 0; i < dataItems; i++) {
      isSelectedList.add(false);
    }
  else
    for (int i = 0; i < dataItems; i++)
      if (i != index) isSelectedList[i] = false;
}

class UiDropdown extends StatefulWidget {
  UiDropdown({
    Key? key,
    required this.dataLables,
    required this.hint,
  }) : super(key: key);
  //passed variables
  final List<String> dataLables;
  final String hint;

  @override
  State<UiDropdown> createState() => _UiDropdownState();
}

class _UiDropdownState extends State<UiDropdown> {
  //local variables
  late double widgetHeight;
  late double widgetWidth;
  late double xPosition;
  late double yPosition;
  late GlobalKey actionKey;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.hint);
  }

  void generateGeometryOfWidget() {
    final RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    widgetHeight = renderBox.size.height;
    widgetWidth = renderBox.size.width;
    xPosition = offset.dx;
    yPosition = offset.dy;
    print("Height     : $widgetHeight");
    print("Width      : $widgetWidth");
    print("xPosition  : $xPosition");
    print("yPosition  : $yPosition");
  }

  OverlayEntry generateFloatingBox() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: xPosition,
          width: widgetWidth,
          top: yPosition + widgetHeight,
          height: widget.dataLables.length * widgetHeight + 40,
          child: DropdownWindow(
            dataLables: widget.dataLables,
            itemHeight: DimentionLib.h80,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          isDropdownOpen = !isDropdownOpen;
        });
        if (!isDropdownOpen)
          floatingBox.remove();
        else {
          generateGeometryOfWidget();
          floatingBox = generateFloatingBox();
          Overlay.of(context)!.insert(floatingBox);
        }
        updateSelections(widget.dataLables.length, -1);
      },
      child: Container(
        height: DimentionLib.h80,
        decoration: BoxDecoration(
          color: ColorLib.fieldWhite,
          borderRadius: BorderRadius.circular(DimentionLib.r10),
          border: Border.all(
            color: isDropdownOpen ? ColorLib.huePrimaryBlue : ColorLib.transp,
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
                    text: selectedChoice,
                    style: TxtStyleLib.hintTxt,
                  ),
                ),
                Visibility(
                  visible: isSelectedList.isEmpty,
                  child: Txt(
                    text: widget.hint,
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
                  color: isDropdownOpen
                      ? ColorLib.huePrimaryBlue
                      : ColorLib.greySpace,
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

class DropdownWindow extends StatelessWidget {
  DropdownWindow({
    Key? key,
    required this.itemHeight,
    required this.dataLables,
  }) {
    for (int i = 0; i < dataLables.length; i++) {
      dropdownItems.add(initList(i));
    }
  }

  final double itemHeight;
  final List<String> dataLables;
  final List<DropdownItem> dropdownItems = [];

  DropdownItem initList(int idx) {
    if (idx == 0)
      return DropdownItem.first(
        dataLable: dataLables[0],
        itemHeight: itemHeight,
        index: idx,
        dataItems: dataLables.length,
      );
    else if (idx == dataLables.length - 1)
      return DropdownItem.last(
        dataLable: dataLables[idx],
        itemHeight: itemHeight,
        index: idx,
        dataItems: dataLables.length,
      );
    return DropdownItem(
      itemHeight: itemHeight,
      dataLable: dataLables[idx],
      index: idx,
      dataItems: dataLables.length,
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
            height: dataLables.length * itemHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimentionLib.r10)),
            child: Column(
              children: [
                for (int i = 0; i < dataLables.length; i++) dropdownItems[i]
              ],
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
    required this.itemHeight,
    required this.dataLable,
    required this.index,
    required this.dataItems,
    this.isFirestItem: false,
    this.isLastItem: false,
  }) : super(key: key);

  final double itemHeight;
  final String dataLable;
  final bool isFirestItem, isLastItem;
  final int index, dataItems;

  factory DropdownItem.first(
      {String? dataLable, double? itemHeight, int? index, int? dataItems}) {
    return DropdownItem(
      itemHeight: itemHeight!,
      dataLable: dataLable!,
      isFirestItem: true,
      index: index!,
      dataItems: dataItems!,
    );
  }

  factory DropdownItem.last(
      {String? dataLable, double? itemHeight, int? index, int? dataItems}) {
    return DropdownItem(
      itemHeight: itemHeight!,
      dataLable: dataLable!,
      isLastItem: true,
      index: index!,
      dataItems: dataItems!,
    );
  }

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        floatingBox.remove();
        print("Index: ${widget.index}");
        print("SelectionList: $isSelectedList");
        setState(() {
          isDropdownOpen = !isDropdownOpen;
          selectedChoice = widget.dataLable.toUpperCase().trim();
          print(selectedChoice);
          isSelectedList[widget.index] = true;
          print("List with index ${widget.index} has value ${isSelectedList[widget.index]}");
          updateSelections(widget.dataItems, widget.index);
          print("List with index ${widget.index} has value ${isSelectedList[widget.index]}");
        });
        
      },
      child: Container(
        height: widget.itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: widget.isFirestItem
                ? Radius.circular(DimentionLib.r10)
                : Radius.zero,
            bottom: widget.isLastItem
                ? Radius.circular(DimentionLib.r10)
                : Radius.zero,
          ),
          color: ColorLib.huePrimaryBlueDull.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: DimentionLib.w24),
        child: Row(
          children: [
            Txt(
              text: widget.dataLable,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: DimentionLib.sp16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: isSelectedList[widget.index]
                    ? ColorLib.creamWhite
                    : ColorLib.huePrimaryBlueDull,
                // color: ColorLib.huePrimaryBlueDull,
              ),
            ),
            Spacer(),
            Icon(
              // Icons.store_mall_directory_rounded,
              // color: ColorLib.huePrimaryBlueDull,
              isSelectedList[widget.index]
                  ? Icons.store_mall_directory_rounded
                  : Icons.store_mall_directory_outlined,
              color: isSelectedList[widget.index]
                  ? ColorLib.creamWhite
                  : ColorLib.huePrimaryBlueDull,
            )
          ],
        ),
      ),
    );
  }
}
