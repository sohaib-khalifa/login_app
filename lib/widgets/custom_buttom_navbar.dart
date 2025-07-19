import 'package:flutter/material.dart';
import 'package:login_app_test/core/theme/app_color.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<IconData> icons;
  final List<String> labels;
  final List<Widget> pages;
  final Color selectedColor;
  final Color unselectedColor;
  final int initialIndex;

  const CustomBottomNavBar({
    super.key,
    required this.icons,
    required this.labels,
    required this.pages,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = AppColors.grey,
    this.initialIndex = 0,
  }) : assert(
         icons.length == labels.length && labels.length == pages.length,
         'icons, labels, and pages must have the same length',
       );

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late int _currentIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    if (_currentIndex != index) {
      setState(() {
        _controller.reset();
        _currentIndex = index;
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: widget.pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [BoxShadow(color: AppColors.grey, blurRadius: 10)],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.icons.length, (index) {
            final isSelected = _currentIndex == index;
            return GestureDetector(
              onTap: () => _onTabChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.icons[index],
                      size: 20,
                      color:
                          isSelected
                              ? widget.selectedColor
                              : widget.unselectedColor,
                    ),
                    Text(
                      widget.labels[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected
                                ? widget.selectedColor
                                : widget.unselectedColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
