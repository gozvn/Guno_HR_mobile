import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/company/data/dto/company_doc_dto.dart';
import 'package:gu_hr_mobile/features/company/domain/company_doc_tree.dart';

CompanyDocDto _doc({
  required int id,
  int? parentId,
  String type = 'file',
  String name = 'file.pdf',
}) =>
    CompanyDocDto(
      id: id,
      parentId: parentId,
      name: name,
      type: type,
      createdAt: '2026-01-01T00:00:00Z',
    );

void main() {
  group('CompanyDocTree.build', () {
    test('empty list returns empty tree', () {
      final result = CompanyDocTree.build([]);
      expect(result, isEmpty);
    });

    test('single root file returns one node with no children', () {
      final result = CompanyDocTree.build([_doc(id: 1)]);
      expect(result.length, 1);
      expect(result.first.doc.id, 1);
      expect(result.first.children, isEmpty);
    });

    test('single root folder returns node with no children when no children exist', () {
      final result = CompanyDocTree.build([
        _doc(id: 1, type: 'folder', name: 'Policies'),
      ]);
      expect(result.length, 1);
      expect(result.first.isFolder, isTrue);
      expect(result.first.children, isEmpty);
    });

    test('folder with two child files builds correct tree', () {
      final flat = [
        _doc(id: 1, type: 'folder', name: 'Policies'),
        _doc(id: 2, parentId: 1, name: 'leave-policy.pdf'),
        _doc(id: 3, parentId: 1, name: 'dress-code.pdf'),
      ];
      final result = CompanyDocTree.build(flat);

      expect(result.length, 1);
      final folder = result.first;
      expect(folder.isFolder, isTrue);
      expect(folder.children.length, 2);
      final childIds = folder.children.map((n) => n.doc.id).toSet();
      expect(childIds, containsAll([2, 3]));
    });

    test('nested folders (2 levels) build correctly', () {
      final flat = [
        _doc(id: 1, type: 'folder', name: 'HR'),
        _doc(id: 2, parentId: 1, type: 'folder', name: 'Policies'),
        _doc(id: 3, parentId: 2, name: 'policy.pdf'),
      ];
      final result = CompanyDocTree.build(flat);

      expect(result.length, 1);
      final hr = result.first;
      expect(hr.children.length, 1);
      final policies = hr.children.first;
      expect(policies.isFolder, isTrue);
      expect(policies.children.length, 1);
      expect(policies.children.first.doc.id, 3);
    });

    test('multiple root nodes are all returned', () {
      final flat = [
        _doc(id: 1, type: 'folder', name: 'HR'),
        _doc(id: 2, type: 'folder', name: 'Finance'),
        _doc(id: 3, name: 'readme.txt'),
      ];
      final result = CompanyDocTree.build(flat);
      expect(result.length, 3);
    });

    test('orphaned child (invalid parent_id) appears under null root', () {
      // parent_id=99 does not exist — group remains under that phantom key
      // and won't appear in the tree (no root reference). Result: only root doc.
      final flat = [
        _doc(id: 1, name: 'root.pdf'),
        _doc(id: 2, parentId: 99, name: 'orphan.pdf'),
      ];
      final result = CompanyDocTree.build(flat);
      // Only root-level (parentId==null) items appear.
      expect(result.length, 1);
      expect(result.first.doc.id, 1);
    });

    test('file nodes never have children even if another doc references them', () {
      // id=1 is a file but id=2 has parent_id=1 — file cannot be parent.
      final flat = [
        _doc(id: 1, type: 'file', name: 'doc.pdf'),
        _doc(id: 2, parentId: 1, name: 'child.pdf'),
      ];
      final result = CompanyDocTree.build(flat);
      final fileNode = result.firstWhere((n) => n.doc.id == 1);
      // Because type=='file', children list is const [] regardless.
      expect(fileNode.children, isEmpty);
    });
  });
}
