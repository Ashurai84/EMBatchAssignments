import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// ProfileCardScreen demonstrates the composition of core Flutter widgets:
/// 1. Column - Vertical stacking of card elements, headers, bio, and sections
/// 2. Row - Horizontal alignment of stats, contact info, and action buttons
/// 3. Container - Styling, gradients, padding, margins, shadows, and rounded borders
/// 4. CircleAvatar - Circular profile image with glowing gradient border
/// 5. Text - Typography hierarchy with custom styles, weights, and colors
/// 6. Icon - Visual iconography for badges, contacts, ratings, and actions
class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  bool _isFollowing = false;
  int _followersCount = 1240;
  bool _isBookmarked = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followersCount += _isFollowing ? 1 : -1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _isFollowing ? AppColors.accentEmerald : AppColors.primaryDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            Icon(
              _isFollowing ? Icons.check_circle_rounded : Icons.info_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              _isFollowing ? 'You are now following Ashutosh Rai!' : 'Unfollowed Ashutosh Rai',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile Card Assignment',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              color: _isBookmarked ? AppColors.accentAmber : AppColors.textSecondary,
            ),
            onPressed: _toggleBookmark,
            tooltip: 'Bookmark Profile',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        // Root Container with soft sky blue gradient
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: _buildProfileCard(),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the main Profile Card using Container, Column, Row, CircleAvatar, Text, Icon
  Widget _buildProfileCard() {
    return Container(
      // 3. Container: Outer Card with curved corners, soft sky border, and gentle drop shadow
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        // 1. Column: Vertically stack banner, avatar, name, badges, bio, stats, and buttons
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Decorative Banner Container with Sky Blue Gradient
          Container(
            height: 96,
            decoration: const BoxDecoration(
              gradient: AppColors.headerGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 12,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.4),
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      // 2. Row: Online status badge
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: AppColors.accentEmerald, size: 8),
                        SizedBox(width: 6),
                        Text(
                          'Available for hire',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Overlapping Avatar Positioned at bottom of header banner
                Positioned(
                  bottom: -45,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: _buildAvatarWithGlow(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 52), // Space for overlapping avatar

          // User Name & Verification Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  // 2. Row: Horizontal layout for Name and Verified Icon
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // 5. Text: User's Name
                    Text(
                      'Ashutosh Rai',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(width: 6),
                    // 6. Icon: Verified Checkmark
                    Icon(
                      Icons.verified_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // 5. Text: Professional Title
                const Text(
                  'Flutter & Mobile App Developer',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 6),
                // Location Row
                Row(
                  // 2. Row: Location icon + text
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on_rounded,
                      color: AppColors.accentRose,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Navi Mumbai, India',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // User Bio Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryUltraLight.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.6)),
              ),
              child: const Text(
                'Passionate software engineer building high-performance, delightful cross-platform mobile apps with Flutter & Dart.And help of my poonam mam',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13.5,
                  height: 1.45,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Skills Chips (Container + Row)
          _buildSkillsRow(),

          const SizedBox(height: 16),

          // Divider Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 1,
            color: AppColors.dividerColor,
          ),

          const SizedBox(height: 16),

          // Statistics Section (Row with 3 Columns)
          _buildStatsRow(),

          const SizedBox(height: 16),

          // Contact Details Container Section
          _buildContactInfoSection(),

          const SizedBox(height: 20),

          // Action Buttons Row (Follow & Message)
          _buildActionButtonsRow(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// 4. CircleAvatar with custom light-blue gradient ring and soft shadow
  Widget _buildAvatarWithGlow() {
    return Container(
      // Gradient ring around avatar
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.avatarBorderGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 16,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface,
        ),
        child: const CircleAvatar(
          // 4. CircleAvatar Widget
          radius: 42,
          backgroundColor: AppColors.primaryUltraLight,
          child: CircleAvatar(
            radius: 39,
            backgroundColor: Color(0xFFF0F9FF),
            child: Icon(
              Icons.person_rounded,
              size: 46,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  /// Skills Row using Container, Row, Icon, and Text
  Widget _buildSkillsRow() {
    final skills = [
      {'icon': Icons.flutter_dash_rounded, 'name': 'Flutter', 'color': AppColors.primary, 'bg': AppColors.primaryUltraLight},
      {'icon': Icons.code_rounded, 'name': 'Dart', 'color': AppColors.accentIndigo, 'bg': Color(0xFFEEF2FF)},
      {'icon': Icons.cloud_done_rounded, 'name': 'Firebase', 'color': AppColors.accentAmber, 'bg': Color(0xFFFEF3C7)},
      {'icon': Icons.architecture_rounded, 'name': 'Backend ', 'color': AppColors.accentRose, 'bg': Color(0xFFFFE4E6)},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // 2. Row: Horizontal list of skill tag containers
        mainAxisAlignment: MainAxisAlignment.center,
        children: skills.map((skill) {
          final color = skill['color'] as Color;
          final bg = skill['bg'] as Color;
          return Container(
            // 3. Container: Skill badge styling
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color.withValues(alpha: 0.35),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  skill['icon'] as IconData,
                  size: 14,
                  color: color,
                ),
                const SizedBox(width: 5),
                Text(
                  skill['name'] as String,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Statistics Row containing 3 Stat Columns (Projects, Followers, Rating)
  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // 2. Row: Equidistant distribution of stats
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn('38+', 'Projects', Icons.folder_special_rounded, AppColors.primary),
          _buildStatDivider(),
          _buildStatColumn('$_followersCount', 'Followers', Icons.people_alt_rounded, AppColors.accentIndigo),
          _buildStatDivider(),
          _buildStatColumn('4.9', 'Rating', Icons.star_rounded, AppColors.accentAmber),
        ],
      ),
    );
  }

  /// Helper for building individual stat item using Column, Icon, and Text
  Widget _buildStatColumn(String count, String label, IconData icon, Color iconColor) {
    return Column(
      // 1. Column: Vertically aligns Icon, Number, and Label
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 4),
            Text(
              count,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 30,
      color: AppColors.dividerColor,
    );
  }

  /// Contact Information section built with Container, Column, Row, Icon, Text
  Widget _buildContactInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // 3. Container: Grouped contact info box
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryUltraLight.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.7)),
        ),
        child: Column(
          // 1. Column: Stack contact items vertically
          children: [
            _buildContactRow(Icons.email_outlined, 'Email', '2024.pashutosh@isu.ac.in', AppColors.primary),
            const SizedBox(height: 8),
            _buildContactRow(Icons.phone_outlined, 'Phone', '+91 98765 43210', AppColors.accentEmerald),
            const SizedBox(height: 8),
            _buildContactRow(Icons.link_rounded, 'GitHub', 'github.com/Ashurai84', AppColors.accentIndigo),
          ],
        ),
      ),
    );
  }

  /// Helper row for contact item
  Widget _buildContactRow(IconData icon, String label, String value, Color color) {
    return Row(
      // 2. Row: Horizontal alignment of Icon + Label + Value
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  /// Action Buttons Row: Follow, Message, and Share buttons
  Widget _buildActionButtonsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // 2. Row: Side-by-side action buttons
        children: [
          // Follow Button (Gradient Container)
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: _toggleFollow,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                // 3. Container: Follow button styling
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  gradient: _isFollowing
                      ? const LinearGradient(colors: [AppColors.accentEmerald, Color(0xFF059669)])
                      : AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: (_isFollowing ? AppColors.accentEmerald : AppColors.primary).withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isFollowing ? Icons.check_rounded : Icons.person_add_alt_1_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isFollowing ? 'Following' : 'Follow',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Message Button (Outlined Container)
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Opening chat with Ashutosh Rai...'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                // 3. Container: Message button styling
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.cardBorder,
                    width: 1.5,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: AppColors.primary,
                      size: 17,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Message',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
