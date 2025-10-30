import 'package:flutter/material.dart';

class CannedDropdown extends StatefulWidget {
  const CannedDropdown({super.key});

  @override
  State<CannedDropdown> createState() => _CannedDropdownState();
}

class _CannedDropdownState extends State<CannedDropdown> {
  final List<String> items = ['Canned Response', 'Canned Response Setting'];
  String? selectedValue;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  void _toggleDropdown() {
    if (_isMenuOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isMenuOpen = false;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _isMenuOpen = true;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy - (items.length * 40 + 8),
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, -size.height - 43),
          child: Material(
            color: Colors.white, // พื้นสีขาว
            elevation: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // พื้นสีขาว
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                border: Border(
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide.none,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
                children: items.map((item) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        // selectedValue = item;
                        _toggleDropdown();
                      });

                      // แค่ทำ action ตามที่ต้องการ เช่น print หรือเปิดหน้าใหม่
                      if (item == 'Canned Response Setting') {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) =>
                        //           const CannedResponseSettingPage()),
                        // );
                      } else if (item == 'Canned Response') {
                        // print('Open canned response list');
                      }
                    },
                    hoverColor: Colors.grey, // สีเวลา hover (desktop/web)
                    highlightColor: Colors.grey,
                    splashColor: Colors.grey,
                    child: Container(
                      width: double.infinity, // กว้างเต็มเมนู
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 14, 80, 223),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedValue ?? 'Canned Response',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_up,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
