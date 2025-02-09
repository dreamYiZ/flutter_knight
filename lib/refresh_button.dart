import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onPressed;

  const RefreshButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // 设置合理的持续时间
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePress() {
    setState(() {
      _isLoading = true;
    });

    widget.onPressed();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handlePress,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 36), // 设置按钮的最小宽度和高度
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading
              ? RotationTransition(
                  turns: _controller,
                  child: const Icon(Icons.refresh),
                )
              : const Icon(Icons.refresh),
          const SizedBox(width: 8),
          const Text('刷新列表'),
        ],
      ),
    );
  }
}

