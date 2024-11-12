import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import '../language/language.dart';
import '../views/utils/custom_style.dart';
import '../views/utils/dimensions.dart';
import '../views/utils/size.dart';

abstract class DropdownMenuModel {
  String get title;
}

class CustomDropdownMenu<T> extends StatefulWidget {
  final RxString selectMethod;
  final List<T> itemsList;
  final void Function(T?)? onChanged;
  final bool showSearchField; // Control visibility of the search field
  final Decoration? decoration;
  final Color? labelColor;
  final Color? dropdownIconColor;
  final Widget? leading;
  final bool? isCountryLabelText;

  const CustomDropdownMenu({
    required this.itemsList,
    required this.selectMethod,
    this.onChanged,
    this.decoration,
    this.labelColor,
    this.dropdownIconColor,
    this.leading,
    this.showSearchField = false,
    super.key, this.isCountryLabelText = false,
  });

  @override
  _CustomDropdownMenuState<T> createState() => _CustomDropdownMenuState<T>();
}

class _CustomDropdownMenuState<T> extends State<CustomDropdownMenu<T>>
    with SingleTickerProviderStateMixin {
  bool isDropdownOpened = false;
  final LayerLink _layerLink = LayerLink();
  TextEditingController searchController = TextEditingController();
  List<T> filteredItems = [];
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.itemsList;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    if (isDropdownOpened) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var screenHeight = MediaQuery.of(context).size.height;
    var spaceBelow =
        screenHeight - renderBox.localToGlobal(Offset.zero).dy - size.height;
    var spaceAbove = renderBox.localToGlobal(Offset.zero).dy;

    double itemHeight = 48.0;
    int maxVisibleItems = 6;
    double dropdownHeight =
        _calculateDropdownHeight(itemHeight, maxVisibleItems);

    double spaceThresholdAbove = dropdownHeight - 20.0;
    bool openUpwards =
        spaceBelow < dropdownHeight && spaceAbove > spaceThresholdAbove;

    if (openUpwards && spaceAbove < dropdownHeight) {
      dropdownHeight = spaceAbove - 10.0;
    }

    _overlayEntry = _createOverlayEntry(
        openUpwards: openUpwards, dropdownHeight: dropdownHeight);
    Overlay.of(context).insert(_overlayEntry!);

    setState(() {
      isDropdownOpened = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      isDropdownOpened = false;
      searchController.clear();
      filteredItems = widget.itemsList;
    });
  }

  OverlayEntry _createOverlayEntry(
      {bool openUpwards = false, double dropdownHeight = 200.0}) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(
                  0.0,
                  openUpwards
                      ? -dropdownHeight - size.height * 0.08
                      : size.height,
                ),
                child: _buildDropdownList(dropdownHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateDropdownHeight(double itemHeight, int maxVisibleItems) {
    return filteredItems.length <= maxVisibleItems
        ? filteredItems.length * itemHeight
        : maxVisibleItems * itemHeight;
  }

  Widget _buildDropdownList(double dropdownHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        elevation: 2,
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSizeVertical * 0.5,
          ),
          decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Column(
            children: [
              if (widget.showSearchField) _buildSearchField(),
              if (filteredItems.isNotEmpty)
                _buildFilteredItemsList(dropdownHeight)
              else
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No data found',
                    style: CustomStyle.lightHeading3TextStyle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            filteredItems = widget.itemsList
                .where((item) => _getItemTitle(item)
                    .toLowerCase()
                    .contains(value.toLowerCase()))
                .toList();
          });
        },
        cursorColor: CustomColor.primaryLightColor,
        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: CustomColor.greyColor.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget _buildFilteredItemsList(double dropdownHeight) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: dropdownHeight),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final value = filteredItems[index];
          return _buildDropdownItem(value);
        },
      ),
    );
  }

  Widget _buildDropdownItem(T value) {
    final itemTitle = _getItemTitle(value);

    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(value);
        widget.selectMethod.value = itemTitle;
        _closeDropdown();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: widget.selectMethod.value == itemTitle
              ? CustomColor.primaryLightColor.withOpacity(0.6)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            itemTitle,
            style: CustomStyle.lightHeading4TextStyle.copyWith(
              color:
                  widget.selectMethod.value == itemTitle ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        if (widget.isCountryLabelText == true) ...[
          Text(
            Strings.selectCountry,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryDarkTextColor,
            ),
          ),
          verticalSpace(7),
        ],
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            height: Dimensions.inputBoxHeight * 0.75,
            decoration: widget.decoration ??
                BoxDecoration(
                  border: Border.all(
                    color: isDropdownOpened
                        ? CustomColor.primaryLightColor
                        : CustomColor.primaryLightColor.withOpacity(0.2),
                    width: isDropdownOpened ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.leading != null)
                    Container(
                      child: widget.leading,
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: widget.leading == null
                            ? Dimensions.paddingSize * 0.4
                            : Dimensions.paddingSize * 0.1),
                    child: Text(
                      widget.selectMethod.value,
                      style: GoogleFonts.inter(
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: widget.labelColor ??
                            (isDropdownOpened
                                ? CustomColor.primaryLightColor
                                : null),
                      ),
                    ),
                  ),
                  Icon(
                    isDropdownOpened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: widget.dropdownIconColor ??
                        (isDropdownOpened
                            ? CustomColor.primaryLightColor
                            : CustomColor.primaryDarkTextColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getItemTitle(T item) {
    if (item is DropdownMenuModel) {
      return item.title;
    } else if (item is String) {
      return item;
    } else {
      throw ArgumentError('Unsupported item type: ${item.runtimeType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: _buildDropdownButton(context),
    );
  }
}
