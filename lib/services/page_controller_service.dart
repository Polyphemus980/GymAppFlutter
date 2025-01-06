import 'package:flutter/material.dart';

class PageControllerService {
  PageController? _pageController;

  void setPageController(PageController controller) {
    _pageController = controller;
  }

  void animateToPage(int page) {
    _pageController?.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void dispose() {
    _pageController?.dispose();
    _pageController = null;
  }
}
