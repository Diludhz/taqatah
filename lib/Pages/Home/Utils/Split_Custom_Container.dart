import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:video_player/video_player.dart';

class SplitContainerPageView extends StatefulWidget {
  const SplitContainerPageView({super.key});

  @override
  _SplitContainerPageViewState createState() => _SplitContainerPageViewState();
}

class _SplitContainerPageViewState extends State<SplitContainerPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;
  late List<VideoPlayerController> _videoControllers;
  bool _allVideosInitialized = false;

  @override
  void initState() {
    super.initState();

    // Initialize video controllers
    _videoControllers = [
      VideoPlayerController.asset(custom_split_v1)..setLooping(true),
      VideoPlayerController.asset(custom_split_v2)..setLooping(true),
      VideoPlayerController.asset(custom_split_v3)..setLooping(true),
    ];

    // Load videos asynchronously
    Future.wait(_videoControllers.map((controller) => controller.initialize()))
        .then((_) {
      setState(() {
        _allVideosInitialized = true;
      });
      for (var controller in _videoControllers) {
        controller.play();
      }
    });

    // Automatic sliding every 15 seconds
    _timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      if (_currentPage < _videoControllers.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 115,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildSplitContainer(
                'Take your website to the next level',
                'Get started',
                'assets/icons/split_icon.png',
                _videoControllers[0],
              ),
              _buildSplitContainer(
                'Boost your productivity',
                'Start now',
                'assets/icons/split_icon.png',
                _videoControllers[1],
              ),
              _buildSplitContainer(
                'Expand your reach',
                'Join us',
                'assets/icons/split_icon.png',
                _videoControllers[2],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildDotIndicator(),
        ),
      ],
    );
  }

  Widget _buildSplitContainer(
    String text,
    String buttonText,
    String iconPath,
    VideoPlayerController videoController,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        height: 114,
        width: 357,
        decoration: BoxDecoration(
          color: const Color(0xFF4A3AFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 31,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style: GoogleFonts.dmSans(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4A3AFF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: _allVideosInitialized
                        ? VideoPlayer(videoController)
                        : Container(color: Colors.black), // Placeholder
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    split_custom_icon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Container(
      height: 16,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _videoControllers.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: _buildDot(index == _currentPage),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
