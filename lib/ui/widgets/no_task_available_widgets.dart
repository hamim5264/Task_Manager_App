import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:task_manager_app/data/utilities/colors.dart';

class NoTaskAvailableWarning extends StatelessWidget {
  const NoTaskAvailableWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56.0),
      child: Column(
        children: [
          LineIcon.folderOpen(
            color: mainColor.withValues(alpha: 0.45),
            size: MediaQuery.sizeOf(context).width * 0.30,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text('No Task Available'),
          )
        ],
      ),
    );
  }
}
