import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import '../signals.dart';

class TemplateBrowserDialog extends HookWidget {
  const TemplateBrowserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final templatesFuture =
        useMemoized(() => client.eventTemplate.listTemplates());
    final templatesSnapshot = useFuture(templatesFuture);
    final selectedTemplate = useState<EventTemplate?>(null);

    final localeLanguage = Localizations.localeOf(context).languageCode;
    final filteredTemplates = templatesSnapshot.data
        ?.where((t) => t.language.toLowerCase() == localeLanguage.toLowerCase())
        .toList();

    return Dialog(
      backgroundColor: const Color(0xFF1A1D27),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 800,
        height: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Insert Boilerplate Template',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Body
            Expanded(
              child: templatesSnapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : templatesSnapshot.hasError
                      ? Center(
                          child: Text(
                            'Error loading templates',
                            style: TextStyle(color: Colors.red[300]),
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Left side: List of templates
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F1117),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.white.withAlpha(20)),
                                ),
                                child: ListView.separated(
                                  itemCount: filteredTemplates?.length ?? 0,
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.white.withAlpha(10),
                                    height: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    final template = filteredTemplates![index];
                                    final isSelected =
                                        selectedTemplate.value?.id ==
                                            template.id;

                                    return ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              template.name,
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.white70,
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Colors.white.withAlpha(40)
                                                  : Colors.white.withAlpha(20),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                                template.language.toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        template.description,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white54
                                              : Colors.white38,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      tileColor: isSelected
                                          ? const Color(0xFF6C63FF)
                                              .withAlpha(30)
                                          : null,
                                      selectedTileColor:
                                          const Color(0xFF6C63FF).withAlpha(50),
                                      selected: isSelected,
                                      onTap: () {
                                        selectedTemplate.value = template;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            // Right side: Preview
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F1117),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.white.withAlpha(20)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: selectedTemplate.value == null
                                    ? const Center(
                                        child: Text(
                                          'Select a template to preview',
                                          style:
                                              TextStyle(color: Colors.white38),
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Preview: ${selectedTemplate.value!.name}',
                                            style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: MarkdownBody(
                                                data: selectedTemplate
                                                    .value!.content,
                                                styleSheet: MarkdownStyleSheet(
                                                  p: const TextStyle(
                                                      color: Colors.white70),
                                                  h1: const TextStyle(
                                                      color: Colors.white),
                                                  h2: const TextStyle(
                                                      color: Colors.white),
                                                  h3: const TextStyle(
                                                      color: Colors.white),
                                                  listBullet: const TextStyle(
                                                      color: Colors.white70),
                                                  blockSpacing:
                                                      4.0, // Reduces space between list items and paragraphs
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
            ),

            // Footer
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white54)),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    disabledBackgroundColor:
                        const Color(0xFF6C63FF).withAlpha(100),
                  ),
                  onPressed: selectedTemplate.value == null
                      ? null
                      : () {
                          // Return the selected template content to the caller
                          Navigator.of(context)
                              .pop(selectedTemplate.value!.content);
                        },
                  icon: const Icon(Icons.add_box),
                  label: const Text('Insert Template'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
