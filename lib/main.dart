import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PageView Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controls page navigation.
  final PageController _controller = PageController();

  // Tracks current page index.
  int _currentPage = 0;

  @override
  void dispose() {
    // Frees memory.
    _controller.dispose();
    super.dispose();
  }

  // Builds individual page UI.
  Widget _buildPage({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(icon, size: 55, color: color),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skips to final page.
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  _controller.jumpToPage(2);
                },
                child: const Text('Skip'),
              ),
            ),

            // Enables horizontal swiping.
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage(
                    icon: Icons.explore_rounded,
                    title: 'Discover Places',
                    description: 'Explore exciting destinations and find new adventures around the globe.',
                    color: Colors.deepPurple,
                  ),
                  _buildPage(
                    icon: Icons.bolt_rounded,
                    title: 'Fast & Simple',
                    description: 'Plan your trips effortlessly with quick bookings and real-time updates.',
                    color: Colors.indigo,
                  ),
                  _buildPage(
                    icon: Icons.check_circle_outline_rounded,
                    title: 'Ready to Go',
                    description: 'You are all set! Start exploring your dream destinations today.',
                    color: Colors.teal,
                  ),
                ],
              ),
            ),

            // Holds dots and next button.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Generates page indicator dots.
                  Row(
                    children: List.generate(3, (index) {
                      final bool isActive = _currentPage == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: isActive ? 24 : 8,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.deepPurple : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),

                  // Handles Next/Get Started actions.
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Welcome! Onboarding finished.')),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}