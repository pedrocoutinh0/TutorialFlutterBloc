import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tutorialblocflutter/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislike,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  onTap: null,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text('Add to Bookmarks')
                        : const Text('Remove from Bookmarks'),
                  ),
                  onTap: likeOrDislike,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                  onTap: cancelOrDeleteCallback,
                ),
              ])
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore'),
                  ),
                  onTap: restoreTaskCallback,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete Forever'),
                  ),
                  onTap: cancelOrDeleteCallback,
                ),
              ],
    );
  }
}
