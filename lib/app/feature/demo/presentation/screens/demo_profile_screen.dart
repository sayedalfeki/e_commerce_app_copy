import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flower_app/app/core/constants/demo_data.dart';
import 'package:flower_app/app/feature/demo/presentation/widgets/profile_info_section.dart';

class DemoProfileScreen extends StatelessWidget {
  const DemoProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = DemoData.sampleUserProfile;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade200, Colors.pink.shade100],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(profile.profileImage),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    profile.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    profile.email,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Total Orders',
                      value: profile.totalOrders.toString(),
                      icon: Icons.shopping_bag,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _StatCard(
                      label: 'Total Spent',
                      value: '\$${profile.totalSpent.toStringAsFixed(2)}',
                      icon: Icons.attach_money,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _InfoTile(label: 'Name', value: profile.name),
                  _InfoTile(label: 'Email', value: profile.email),
                  _InfoTile(label: 'Phone', value: profile.phone),
                  SizedBox(height: 24.h),
                  Text(
                    'Address Information',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _InfoTile(label: 'Street', value: profile.address),
                  _InfoTile(label: 'City', value: profile.city),
                  _InfoTile(label: 'Country', value: profile.country),
                  _InfoTile(label: 'Postal Code', value: profile.postalCode),
                  SizedBox(height: 24.h),
                  Text(
                    'Saved Addresses',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ...profile.savedAddresses
                      .map(
                        (address) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16.sp,
                                  color: Colors.pink,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    address,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  SizedBox(height: 24.h),
                  Text(
                    'Payment Methods',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ...profile.paymentMethods
                      .map(
                        (method) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  size: 16.sp,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    method,
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 24.h),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.pink.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.pink, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const _InfoTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
