import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Color? backgroundColor;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.actions = const [],
    this.backgroundColor,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: actions.isNotEmpty
          ? actions
          : [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              _buildIconWithBadge(Icons.link, '1', Colors.red, () {}),
              _buildIconWithBadge(Icons.shopping_cart, '2', Colors.pink, () {}),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.fullscreen, color: Colors.black),
                onPressed: () {},
              ),
            ],
    );
  }

  Widget _buildIconWithBadge(
    IconData icon,
    String badgeText,
    Color badgeColor,
    VoidCallback onPressed,
  ) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onPressed,
        ),
        Positioned(
          right: 11,
          top: 11,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              badgeText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}