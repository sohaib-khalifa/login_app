import 'package:flutter/material.dart';
import 'dart:async';


class StoryViewer extends StatefulWidget {
  final List<String> stories;
  final int initialIndex;

  const StoryViewer({
    super.key,
    required this.stories,
    required this.initialIndex,
  });

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late final PageController _pageController;
  late int _currentIndex;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);

    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < widget.stories.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          controller: _pageController,
          itemCount: widget.stories.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Hero(
              tag: widget.stories[index],
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.stories[index],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 40,
                    left: 20,
                    child: Text(
                      widget.stories[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

      ),
    );
  }
}

