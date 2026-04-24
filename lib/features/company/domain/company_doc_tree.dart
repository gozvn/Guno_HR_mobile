import '../data/dto/company_doc_dto.dart';

// Hierarchical node for the document tree UI.
class DocNode {
  const DocNode({required this.doc, required this.children});

  final CompanyDocDto doc;
  final List<DocNode> children;

  bool get isFolder => doc.type == 'folder';
}

// Builds a tree from a flat list with parent_id references.
// Root nodes have parentId == null.
abstract final class CompanyDocTree {
  static List<DocNode> build(List<CompanyDocDto> flat) {
    // Group docs by parent_id — null key holds root-level items.
    final byParent = <int?, List<CompanyDocDto>>{};
    for (final d in flat) {
      byParent.putIfAbsent(d.parentId, () => []).add(d);
    }

    // Recursive builder — stops when no children for a given pid.
    List<DocNode> children(int? pid) =>
        (byParent[pid] ?? const [])
            .map((d) => DocNode(
                  doc: d,
                  // Only folders recurse; files have no children.
                  children: d.type == 'folder' ? children(d.id) : const [],
                ))
            .toList();

    return children(null);
  }
}
